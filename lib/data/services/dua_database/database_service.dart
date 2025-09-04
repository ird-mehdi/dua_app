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
import 'package:drift/isolate.dart';
import 'dart:isolate';

part 'database_service.g.dart';

@DriftDatabase(tables: [Duas, Categories, Subcategories])
class DuaDatabase extends _$DuaDatabase {
  bool _isInitialized = false;
  static const _queryTimeout = Duration(seconds: 5);

  // Track active isolate connections
  static final Map<String, DriftIsolate> _activeIsolates = {};
  static final Map<String, ReceivePort> _activeReceivePorts = {};

  // Memory cache for database queries
  static final Map<String, List<Dua>> _queryCache = {};
  static List<Dua>? _allDuasCache;
  static List<Category>? _allCategoriesCache;
  static List<Subcategory>? _allSubcategoriesCache;
  static final Map<int, Category> _categoryByIdCache = {};
  static final Map<int, List<Subcategory>> _subcategoriesByCategoryCache = {};

  // Cache for specific dua fetching with required fields only
  static final Map<int, Map<String, dynamic>> _duaLightCache = {};

  // Track the current database connection

  DuaDatabase({QueryExecutor? executor}) : super(executor ?? loadDatabase()) {
    // Initialize in a more optimized way without blocking
    _initializeDatabase();
    // Generate a unique ID for this connection
  }

  @override
  int get schemaVersion => 1;

  Future<void> _initializeDatabase() async {
    if (_isInitialized) return;

    try {
      // Run verification and initialization in parallel
      final results = await Future.wait([verifyDatabase(), _initDatabase()],
          eagerError: true);
      // If both succeeded, mark as initialized
      if (results[0] == true && results[1] == true) {
        _isInitialized = true;
        print('Database initialized successfully');
      } else {
        print(
            'Database initialization incomplete: ${results[0]}, ${results[1]}');
      }
    } catch (e, stackTrace) {
      print('Database initialization failed: $e');
      print('Stack trace: $stackTrace');
      // If there's an error, we'll try again when data is requested
      _isInitialized = false;
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
        // Let database_loader handle creating the file
        final isFound = await isDatabaseFileFound();
        if (!isFound) {
          print('verifyDatabase: Failed to find or create database file');
        }
        return isFound;
      }

      final size = await file.length();
      if (size == 0) {
        print('verifyDatabase: Database file exists but is empty!');
        // Let database_loader handle creating the file
        final isFound = await isDatabaseFileFound();
        if (!isFound) {
          print('verifyDatabase: Failed to populate empty database file');
        }
        return isFound;
      }

      print('verifyDatabase: Database file exists with size $size bytes');
      return true;
    } catch (e, stackTrace) {
      print('verifyDatabase: Error verifying database: $e');
      print('Stack trace: $stackTrace');
      return false;
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

      // Only select approved columns - avoid SELECT *
      final query = selectOnly(duas)
        ..addColumns([
          duas.id,
          duas.name,
          duas.clean,
          duas.categoryId,
          duas.subcategoryId,
          duas.groups,
        ])
        ..orderBy([
          OrderingTerm(expression: duas.id),
        ]);

      // Execute query with timeout
      final rows = await query.get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('getAllDuas: Query timed out, returning empty list');
          return [];
        },
      );

      print('getAllDuas: Found ${rows.length} duas in database');

      // Convert rows to Dua objects
      final results = <Dua>[];
      for (final row in rows) {
        final id = row.read(duas.id);
        if (id != null) {
          results.add(Dua(
            id: id,
            groups: row.read(duas.groups) ?? '[]',
            name: row.read(duas.name),
            clean: row.read(duas.clean),
            categoryId: row.read(duas.categoryId),
            subcategoryId: row.read(duas.subcategoryId),
          ));
        }
      }

      // Cache the results in memory
      _allDuasCache = results;

      return results;
    } catch (e, stackTrace) {
      print('getAllDuas: Error fetching duas: $e');
      print('getAllDuas: Stack trace: $stackTrace');
      return [];
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
    _categoryByIdCache.clear();
    _subcategoriesByCategoryCache.clear();
    _duaLightCache.clear();
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

  // Method to track an active isolate connection
  static void trackIsolate(String id, DriftIsolate isolate,
      [ReceivePort? port]) {
    // Clean up any existing isolate with the same ID first
    if (_activeIsolates.containsKey(id)) {
      try {
        _activeIsolates[id]?.shutdownAll();
        _activeReceivePorts[id]?.close();
      } catch (e) {
        print('Error closing existing isolate with ID $id: $e');
      }
    }

    _activeIsolates[id] = isolate;
    if (port != null) {
      _activeReceivePorts[id] = port;
    }
    print('Tracked isolate with ID: $id');
  }

  // Method to close all isolates when thread work is complete
  static Future<void> closeAllIsolates() async {
    print('Closing all active isolates: ${_activeIsolates.length}');

    try {
      // Close all active isolate connections
      for (final entry in _activeIsolates.entries.toList()) {
        final id = entry.key;
        final isolate = entry.value;

        try {
          // Shutdown the drift isolate
          await isolate.shutdownAll();
          print('Successfully closed isolate with ID: $id');
        } catch (e) {
          print('Error closing isolate with ID: $id - $e');
        } finally {
          // Always close the receive port if it exists
          _activeReceivePorts[id]?.close();

          // Remove these entries regardless of success/failure
          _activeIsolates.remove(id);
          _activeReceivePorts.remove(id);
        }
      }

      print('All isolates closed successfully');
    } catch (e) {
      print('Error while closing all isolates: $e');
    }
  }

  // Explicitly close a specific isolate
  static Future<void> closeIsolate(String id) async {
    print('Closing isolate with ID: $id');
    try {
      final isolate = _activeIsolates[id];
      if (isolate != null) {
        await isolate.shutdownAll();
        _activeIsolates.remove(id);
        print('Successfully closed isolate with ID: $id');
      }

      final port = _activeReceivePorts[id];
      if (port != null) {
        port.close();
        _activeReceivePorts.remove(id);
      }
    } catch (e) {
      print('Error closing isolate with ID: $id - $e');
    }
  }

  // Get specific dua by ID with only required fields
  Future<Map<String, dynamic>?> getDuaLightById(int id,
      {bool forceRefresh = false}) async {
    print(
        'getDuaLightById: Getting dua with ID $id (forceRefresh: $forceRefresh)');
    try {
      // Return from cache if available and not forcing refresh
      if (!forceRefresh && _duaLightCache.containsKey(id)) {
        print('getDuaLightById: Returning dua $id from cache');
        return _duaLightCache[id];
      }

      // If database is not initialized, try to initialize it
      if (!_isInitialized) {
        print(
            'getDuaLightById: Database not yet fully initialized, initializing...');
        await _initializeDatabase();
      }

      // Only select approved columns (id, name/title, clean/arabic_text)
      final query = selectOnly(duas)
        ..addColumns([
          duas.id,
          duas.name,
          duas.clean,
        ])
        ..where(duas.id.equals(id));

      // Execute query with timeout
      final row = await query.getSingleOrNull().timeout(
        _queryTimeout,
        onTimeout: () {
          print('getDuaLightById: Query timed out, returning null');
          return null;
        },
      );

      if (row == null) {
        print('getDuaLightById: Dua with ID $id not found');
        return null;
      }

      // Map the result to a simplified dua object with only approved fields
      final Map<String, dynamic> dua = {
        'id': row.read(duas.id),
        'title': row.read(duas.name),
        'arabic_text': row.read(duas.clean),
      };

      // Cache the result
      _duaLightCache[id] = dua;

      print('getDuaLightById: Successfully fetched dua $id');
      return dua;
    } catch (e, stackTrace) {
      print('getDuaLightById: Error fetching dua: $e');
      print('getDuaLightById: Stack trace: $stackTrace');
      return null;
    }
  }

  // Get duas by category ID with only required fields
  Future<List<Map<String, dynamic>>> getDuasLightByCategory(int categoryId,
      {bool forceRefresh = false}) async {
    print(
        'getDuasLightByCategory: Getting duas for category $categoryId (forceRefresh: $forceRefresh)');
    try {
      // Create a cache key for this query
      final String cacheKey = 'category_light_$categoryId';

      // Return from cache if available and not forcing refresh
      if (!forceRefresh && _queryCache.containsKey(cacheKey)) {
        final List<Dua> cachedDuas = _queryCache[cacheKey]!;
        print(
            'getDuasLightByCategory: Returning ${cachedDuas.length} duas from cache for category $categoryId');

        // Convert to lightweight format with only approved columns
        return cachedDuas
            .map((dua) => {
                  'id': dua.id,
                  'title': dua.name,
                  'arabic_text': dua.clean,
                })
            .toList();
      }

      // If database is not initialized, try to initialize it
      if (!_isInitialized) {
        print(
            'getDuasLightByCategory: Database not yet fully initialized, initializing...');
        await _initializeDatabase();
      }

      // Only select approved columns and filter by category
      final query = selectOnly(duas)
        ..addColumns([
          duas.id,
          duas.name,
          duas.clean,
        ])
        ..where(duas.categoryId.equals(categoryId))
        ..orderBy([
          OrderingTerm(expression: duas.id),
        ]);

      // Execute query with timeout
      final rows = await query.get().timeout(
        _queryTimeout,
        onTimeout: () {
          print(
              'getDuasLightByCategory: Query timed out, returning empty list');
          return [];
        },
      );

      print(
          'getDuasLightByCategory: Found ${rows.length} duas for category $categoryId');

      // Convert to lightweight format
      final results = <Map<String, dynamic>>[];
      for (final row in rows) {
        final id = row.read(duas.id);
        if (id != null) {
          results.add({
            'id': id,
            'title': row.read(duas.name),
            'arabic_text': row.read(duas.clean),
          });
        }
      }

      // Cache the results
      final cachedDuas = <Dua>[];
      for (final item in results) {
        final id = item['id'] as int;
        cachedDuas.add(Dua(
          id: id,
          groups: '[]',
        ));
      }
      _queryCache[cacheKey] = cachedDuas;

      return results;
    } catch (e, stackTrace) {
      print('getDuasLightByCategory: Error fetching duas: $e');
      print('getDuasLightByCategory: Stack trace: $stackTrace');
      return [];
    }
  }

  // Clear specific dua cache (for use when forcing refresh)
  void clearDuaLightCache(int id) {
    _duaLightCache.remove(id);
  }

  // Clear category duas cache
  void clearCategoryDuasLightCache(int categoryId) {
    _queryCache.remove('category_light_$categoryId');
  }

  // Search duas with only approved columns
  Future<List<Map<String, dynamic>>> searchDuasLight(String query,
      {bool forceRefresh = false}) async {
    print('searchDuasLight: Searching duas with query "$query"');
    try {
      // Create a cache key for this search
      final String cacheKey = 'search_light_$query';

      // Return from cache if available and not forcing refresh
      if (!forceRefresh && _queryCache.containsKey(cacheKey)) {
        final List<Dua> cachedDuas = _queryCache[cacheKey]!;
        print(
            'searchDuasLight: Returning ${cachedDuas.length} duas from cache for query "$query"');

        // Convert to lightweight format with only approved columns
        return cachedDuas
            .map((dua) => {
                  'id': dua.id,
                  'title': dua.name,
                  'arabic_text': dua.clean,
                })
            .toList();
      }

      // If database is not initialized, try to initialize it
      if (!_isInitialized) {
        print(
            'searchDuasLight: Database not yet fully initialized, initializing...');
        await _initializeDatabase();
      }

      // Only select approved columns and filter by search term
      final searchTerm = '%$query%'; // Add wildcards for LIKE query
      final queryObj = selectOnly(duas)
        ..addColumns([
          duas.id,
          duas.name,
          duas.clean,
        ])
        ..where(duas.name.like(searchTerm) | duas.clean.like(searchTerm))
        ..orderBy([
          OrderingTerm(expression: duas.id),
        ]);

      // Execute query with timeout
      final rows = await queryObj.get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('searchDuasLight: Query timed out, returning empty list');
          return [];
        },
      );

      print(
          'searchDuasLight: Found ${rows.length} duas matching query "$query"');

      // Convert to lightweight format
      final results = <Map<String, dynamic>>[];
      for (final row in rows) {
        final id = row.read(duas.id);
        if (id != null) {
          results.add({
            'id': id,
            'title': row.read(duas.name),
            'arabic_text': row.read(duas.clean),
          });
        }
      }

      // Cache the results
      final cachedDuas = <Dua>[];
      for (final item in results) {
        final id = item['id'] as int;
        cachedDuas.add(Dua(
          id: id,
          groups: '[]',
        ));
      }
      _queryCache[cacheKey] = cachedDuas;

      return results;
    } catch (e, stackTrace) {
      print('searchDuasLight: Error searching duas: $e');
      print('searchDuasLight: Stack trace: $stackTrace');
      return [];
    }
  }
}
