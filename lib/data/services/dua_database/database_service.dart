// ignore_for_file: avoid_print

import 'package:drift/drift.dart';
import 'package:dua/data/mappers/dua_groups_mapper.dart';
import 'package:dua/data/services/dua_database/database_loader.dart';
import 'package:dua/data/services/dua_database/table/dua_database_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dua/core/constants/app_constant.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:flutter/services.dart';

part 'database_service.g.dart';

@DriftDatabase(tables: [Duas])
class DuaDatabase extends _$DuaDatabase {
  bool _isInitialized = false;
  static const _queryTimeout = Duration(seconds: 5);

  DuaDatabase({QueryExecutor? executor}) : super(executor ?? loadDatabase()) {
    // Initialize in a more optimized way without blocking
    _initializeDatabase();
  }

  @override
  int get schemaVersion => 1;

  Future<void> _initializeDatabase() async {
    try {
      // Run verification and initialization in parallel
      final results = await Future.wait([
        verifyDatabase(),
        _initDatabase()
      ], eagerError: true);
      
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

      if (!file.existsSync()) {
        print(
            'verifyDatabase: ERROR - Database file does not exist at ${file.path}');
        await _manualCopyDatabaseFromAssets(file.path);
      } else {
        final fileSize = await file.length();
        print(
            'verifyDatabase: Database file exists at ${file.path}, size: $fileSize bytes');

        if (fileSize == 0) {
          print('verifyDatabase: WARNING - Database file exists but is empty!');
          await _manualCopyDatabaseFromAssets(file.path);
        }
      }
      return true;
    } catch (e, stackTrace) {
      print('verifyDatabase: ERROR checking database: $e');
      print('verifyDatabase: Stack trace: $stackTrace');
      return false;
    }
  }

  Future<void> _manualCopyDatabaseFromAssets(String targetPath) async {
    print(
        '_manualCopyDatabaseFromAssets: Manually copying database from assets...');
    try {
      final File targetFile = File(targetPath);

      if (!targetFile.parent.existsSync()) {
        targetFile.parent.createSync(recursive: true);
      }

      if (targetFile.existsSync()) {
        targetFile.deleteSync();
      }

      try {
        final ByteData data = await rootBundle.load(AppConstant.dbAssetPath);
        final List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await targetFile.writeAsBytes(bytes);
        print(
            '_manualCopyDatabaseFromAssets: Successfully copied database, size: ${await targetFile.length()} bytes');
      } catch (e) {
        print('_manualCopyDatabaseFromAssets: Failed to copy database: $e');
        // Try alternative paths
        try {
          final ByteData data =
              await rootBundle.load('assets/databases/database.sqlite');
          final List<int> bytes =
              data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
          await targetFile.writeAsBytes(bytes);
          print(
              '_manualCopyDatabaseFromAssets: Successfully copied database using alternative path');
        } catch (e) {
          print(
              '_manualCopyDatabaseFromAssets: Failed to copy database using alternative path: $e');
        }
      }
    } catch (e, stackTrace) {
      print('_manualCopyDatabaseFromAssets: Exception: $e');
      print('_manualCopyDatabaseFromAssets: Stack trace: $stackTrace');
    }
  }

  Future<bool> _initDatabase() async {
    print('_initDatabase: Checking database initialization...');
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, AppConstant.dbName));
      print('_initDatabase: Database file path: ${file.path}');
      print('_initDatabase: Database file exists: ${file.existsSync()}');
      if (file.existsSync()) {
        print(
            '_initDatabase: Database file size: ${await file.length()} bytes');
      } else {
        print('_initDatabase: Database file not found!');
        return false;
      }

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
      // If database is not initialized, try to initialize it
      if (!_isInitialized) {
        print('getAllDuas: Database not yet fully initialized, initializing...');
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
      return await (select(duas)
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
    } catch (e) {
      print('getDuasByCategory: Error: $e');
      return [];
    }
  }

  Future<Dua?> getDuaById(int id) async {
    try {
      final results =
          await (select(duas)..where((t) => t.id.equals(id))).get().timeout(
        _queryTimeout,
        onTimeout: () {
          print('getDuaById: Query timed out');
          return [];
        },
      );

      return results.isNotEmpty ? results.first : null;
    } catch (e) {
      print('getDuaById: Error: $e');
      return null;
    }
  }
}
