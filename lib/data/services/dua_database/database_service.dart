// ignore_for_file: avoid_print

import 'package:drift/drift.dart';
import 'package:dua/data/mappers/dua_groups_mapper.dart';
import 'package:dua/data/services/dua_database/database_loader.dart';
import 'package:dua/data/services/dua_database/table/dua_database_table.dart';
import 'package:dua/data/services/dua_database/table/categories_table.dart';
import 'package:dua/data/services/dua_database/table/subcategories_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dua/core/constants/app_constant.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:flutter/services.dart';

part 'database_service.g.dart';

@DriftDatabase(tables: [Duas, Categories, Subcategories])
class DuaDatabase extends _$DuaDatabase {
  bool _isInitialized = false;
  static const _queryTimeout = Duration(seconds: 5);

  // Memory cache for database queries
  static final Map<String, List<Dua>> _queryCache = {};
  static final Map<int, Dua> _duaByIdCache = {};
  static List<Dua>? _allDuasCache;
  static List<Category>? _allCategoriesCache;
  static List<Subcategory>? _allSubcategoriesCache;
  static final Map<int, Category> _categoryByIdCache = {};
  static final Map<int, List<Subcategory>> _subcategoriesByCategoryCache = {};

  DuaDatabase({QueryExecutor? executor}) : super(executor ?? loadDatabase()) {
    // Initialize in a more optimized way without blocking
    _initializeDatabase();
  }

  @override
  int get schemaVersion => 1;

  Future<void> _initializeDatabase() async {
    try {
      // Run verification and initialization in parallel
      final results = await Future.wait([verifyDatabase(), _initDatabase()],
          eagerError: true);
      // If both succeeded, mark as initialized
      if (results[0] == true && results[1] == true) {
        _isInitialized = true;
      }
    } catch (e) {
      print('Database initialization failed: $e');
      // If there's an error, we'll try again when data is requested
    }
  }

  Future<bool> verifyDatabase() async {
    print('verifyDatabase: Checking database file...');
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, AppConstant.dbName));

      // If we have cached data, we can skip verification
      if (_allDuasCache != null && _allDuasCache!.isNotEmpty) {
        return true;
      }

      if (!file.existsSync()) {
        print('verifyDatabase: Database file does not exist!');
        await _copyDatabaseFromAssets(file);
        return false;
      }

      final size = await file.length();
      if (size == 0) {
        print('verifyDatabase: Database file exists but is empty!');
        await _copyDatabaseFromAssets(file);
        return false;
      }

      print('verifyDatabase: Database file exists with size $size bytes');
      return true;
    } catch (e) {
      print('verifyDatabase: Error verifying database: $e');
      return false;
    }
  }

  Future<void> _copyDatabaseFromAssets(File file) async {
    try {
      // Create parent directory if it doesn't exist
      file.parent.createSync(recursive: true);

      final ByteData data = await rootBundle.load(AppConstant.dbAssetPath);
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await file.writeAsBytes(bytes);
      print('_copyDatabaseFromAssets: Database copied from assets');
    } catch (e) {
      print('_copyDatabaseFromAssets: Error copying database: $e');
      await _manualCopyDatabaseFromAssets(file.path);
    }
  }

  Future<void> _manualCopyDatabaseFromAssets(String path) async {
    try {
      final ByteData data = await rootBundle.load(AppConstant.dbAssetPath);
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      print('_manualCopyDatabaseFromAssets: Manual copy successful');
    } catch (e) {
      print('_manualCopyDatabaseFromAssets: Error copying database: $e');
    }
  }

  Future<bool> _initDatabase() async {
    print('_initDatabase: Initializing database...');
    try {
      // Use a shorter timeout to prevent UI blocking
      final count = await (select(duas)..limit(1)).get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('_initDatabase: Database query timed out!');
          return [];
        },
      );

      print('_initDatabase: Retrieved ${count.length} duas from database');
      if (count.isEmpty) {
        print('_initDatabase: Database is empty or query failed');
        return false;
      } else {
        print('_initDatabase: First dua found, database is valid');
        return true;
      }
    } catch (e, stackTrace) {
      print('_initDatabase: Database initialization error: $e');
      print('_initDatabase: Stack trace: $stackTrace');
      return false;
    }
  }

  Future<List<Dua>> getAllDuas() async {
    print('getAllDuas: Getting all duas from database');
    try {
      // Return from memory cache if available
      if (_allDuasCache != null && _allDuasCache!.isNotEmpty) {
        print('getAllDuas: Returning ${_allDuasCache!.length} duas from cache');
        return _allDuasCache!;
      }

      // If database is not initialized, try to initialize it
      if (!_isInitialized) {
        print(
            'getAllDuas: Database not yet fully initialized, initializing...');
        await _initializeDatabase();
      }

      final query = select(duas)
        ..orderBy([
          (t) => OrderingTerm(expression: t.id),
        ]);

      // Execute query with timeout
      final results = await query.get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('getAllDuas: Query timed out, returning empty list');
          return [];
        },
      );

      print('getAllDuas: Found ${results.length} duas in database');

      // Cache the results in memory
      _allDuasCache = results;

      // Also cache individual duas for faster retrieval by ID
      for (final dua in results) {
        _duaByIdCache[dua.id] = dua;
      }

      return results;
    } catch (e, stackTrace) {
      print('getAllDuas: Error fetching duas: $e');
      print('getAllDuas: Stack trace: $stackTrace');
      return [];
    }
  }

  Future<bool> validateDatabase() async {
    print('validateDatabase: Checking database schema...');
    try {
      // If we have cached data, we can skip validation
      if (_allDuasCache != null && _allDuasCache!.isNotEmpty) {
        return true;
      }

      // Try a simple count query first to see if the database is accessible
      final count = await (select(duas)..limit(1)).get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('validateDatabase: Query timed out');
          return [];
        },
      );

      print(
          'validateDatabase: Successfully queried database, found ${count.length} records');
      return true; // Return true even if empty to prevent blocking data flow
    } catch (e, stackTrace) {
      print('validateDatabase: Database validation error: $e');
      print('validateDatabase: Stack trace: $stackTrace');

      // Check if the database file exists and has content
      try {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, AppConstant.dbName));

        if (!file.existsSync()) {
          print('validateDatabase: Database file does not exist!');
          return false;
        }

        final size = await file.length();
        if (size == 0) {
          print('validateDatabase: Database file exists but is empty!');
          return false;
        }

        print(
            'validateDatabase: Database file exists with size $size bytes, but still cannot query it.');
        print(
            'validateDatabase: This suggests a schema mismatch between the app and the database file.');

        // Try to recreate the database from the asset file
        await _manualCopyDatabaseFromAssets(file.path);
        return false;
      } catch (e2) {
        print('validateDatabase: Error checking database file: $e2');
        return false;
      }
    }
  }

  Future<List<Dua>> getDuasByCategory(int categoryId) async {
    try {
      // Check cache first
      final cacheKey = 'category_$categoryId';
      if (_queryCache.containsKey(cacheKey)) {
        return _queryCache[cacheKey]!;
      }

      final results = await (select(duas)
            ..where((t) => t.categoryId.equals(categoryId))
            ..orderBy([(t) => OrderingTerm(expression: t.id)]))
          .get()
          .timeout(
        _queryTimeout,
        onTimeout: () {
          print('getDuasByCategory: Query timed out');
          return [];
        },
      );

      // Cache the results
      _queryCache[cacheKey] = results;

      return results;
    } catch (e) {
      print('getDuasByCategory: Error: $e');
      return [];
    }
  }

  Future<Dua?> getDuaById(int id) async {
    try {
      // Check cache first
      if (_duaByIdCache.containsKey(id)) {
        return _duaByIdCache[id];
      }

      final results =
          await (select(duas)..where((t) => t.id.equals(id))).get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('getDuaById: Query timed out');
          return [];
        },
      );

      final dua = results.isNotEmpty ? results.first : null;

      // Cache the dua if found
      if (dua != null) {
        _duaByIdCache[id] = dua;
      }

      return dua;
    } catch (e) {
      print('getDuaById: Error: $e');
      return null;
    }
  }

  // Methods for Categories
  Future<List<Category>> getAllCategories() async {
    print('getAllCategories: Getting all categories from database');
    try {
      // Return from memory cache if available
      if (_allCategoriesCache != null && _allCategoriesCache!.isNotEmpty) {
        print(
            'getAllCategories: Returning ${_allCategoriesCache!.length} categories from cache');
        return _allCategoriesCache!;
      }

      // If database is not initialized, try to initialize it
      if (!_isInitialized) {
        print(
            'getAllCategories: Database not yet fully initialized, initializing...');
        await _initializeDatabase();
      }

      final query = select(categories);

      // Execute query with timeout
      final results = await query.get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('getAllCategories: Query timed out, returning empty list');
          return [];
        },
      );

      print('getAllCategories: Found ${results.length} categories in database');

      // Cache the results in memory
      _allCategoriesCache = results;

      // Also cache individual categories for faster retrieval by ID
      for (final category in results) {
        _categoryByIdCache[category.id] = category;
      }

      return results;
    } catch (e, stackTrace) {
      print('getAllCategories: Error fetching categories: $e');
      print('getAllCategories: Stack trace: $stackTrace');
      return [];
    }
  }

  Future<Category?> getCategoryById(int id) async {
    try {
      // Check cache first
      if (_categoryByIdCache.containsKey(id)) {
        return _categoryByIdCache[id];
      }

      final results = await (select(categories)..where((t) => t.id.equals(id)))
          .get()
          .timeout(
        _queryTimeout,
        onTimeout: () {
          print('getCategoryById: Query timed out');
          return [];
        },
      );

      if (results.isEmpty) return null;

      final category = results.first;

      // Cache the category if found
      _categoryByIdCache[id] = category;

      return category;
    } catch (e) {
      print('getCategoryById: Error: $e');
      return null;
    }
  }

  // Methods for Subcategories
  Future<List<Subcategory>> getAllSubcategories() async {
    print('getAllSubcategories: Getting all subcategories from database');
    try {
      // Return from memory cache if available
      if (_allSubcategoriesCache != null &&
          _allSubcategoriesCache!.isNotEmpty) {
        print(
            'getAllSubcategories: Returning ${_allSubcategoriesCache!.length} subcategories from cache');
        return _allSubcategoriesCache!;
      }

      // If database is not initialized, try to initialize it
      if (!_isInitialized) {
        print(
            'getAllSubcategories: Database not yet fully initialized, initializing...');
        await _initializeDatabase();
      }

      final query = select(subcategories);

      // Execute query with timeout
      final results = await query.get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('getAllSubcategories: Query timed out, returning empty list');
          return [];
        },
      );

      print(
          'getAllSubcategories: Found ${results.length} subcategories in database');

      // Cache the results in memory
      _allSubcategoriesCache = results;

      return results;
    } catch (e, stackTrace) {
      print('getAllSubcategories: Error fetching subcategories: $e');
      print('getAllSubcategories: Stack trace: $stackTrace');
      return [];
    }
  }

  Future<List<Subcategory>> getSubcategoriesByCategory(int categoryId) async {
    try {
      // Check cache first
      if (_subcategoriesByCategoryCache.containsKey(categoryId)) {
        return _subcategoriesByCategoryCache[categoryId]!;
      }

      final results = await (select(subcategories)
            ..where((t) => t.categoryId.equals(categoryId)))
          .get()
          .timeout(
        _queryTimeout,
        onTimeout: () {
          print('getSubcategoriesByCategory: Query timed out');
          return [];
        },
      );

      // Cache the results
      _subcategoriesByCategoryCache[categoryId] = results;

      return results;
    } catch (e) {
      print('getSubcategoriesByCategory: Error: $e');
      return [];
    }
  }

  // Update the clear cache method to include new caches
  void clearCache() {
    _allDuasCache = null;
    _allCategoriesCache = null;
    _allSubcategoriesCache = null;
    _queryCache.clear();
    _duaByIdCache.clear();
    _categoryByIdCache.clear();
    _subcategoriesByCategoryCache.clear();
    print('Cache cleared from database service');
  }

  // Properly close the database connection
  @override
  Future<void> close() async {
    clearCache();
    try {
      await super.close();
      print('Database connection closed successfully');
    } catch (e) {
      print('Error closing database connection: $e');
    }
  }
}
