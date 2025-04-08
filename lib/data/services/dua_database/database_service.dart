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
  DuaDatabase({QueryExecutor? executor}) : super(executor ?? loadDatabase()) {
    _initDatabase();
    verifyDatabase();
  }

  @override
  int get schemaVersion => 1;

  Future<void> verifyDatabase() async {
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
    } catch (e, stackTrace) {
      print('verifyDatabase: ERROR checking database: $e');
      print('verifyDatabase: Stack trace: $stackTrace');
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
      }
    } catch (e, stackTrace) {
      print('_manualCopyDatabaseFromAssets: Exception: $e');
      print('_manualCopyDatabaseFromAssets: Stack trace: $stackTrace');
    }
  }

  Future<void> _initDatabase() async {
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
      }

      final count = await (select(duas)..limit(10)).get();
      print('_initDatabase: Retrieved ${count.length} duas from database');
      if (count.isEmpty) {
        print('_initDatabase: Database is empty');
      } else {
        print('_initDatabase: First dua: ${count.first.name}');
      }
    } catch (e, stackTrace) {
      print('_initDatabase: Database initialization error: $e');
      print('_initDatabase: Stack trace: $stackTrace');
    }
  }

  Future<List<Dua>> getAllDuas() async {
    print('_getAllDuas: Getting all duas from database');
    try {
      // First, validate that we can actually read from the database
      final validationResult = await validateDatabase();
      if (!validationResult) {
        print('_getAllDuas: Database validation failed, returning empty list');
        return [];
      }

      final query = select(duas)
        ..orderBy([
          (t) => OrderingTerm(expression: t.id),
        ]);

      final results = await query.get();
      print('_getAllDuas: Found ${results.length} duas in database');
      return results;
    } catch (e, stackTrace) {
      print('_getAllDuas: Error fetching duas: $e');
      print('_getAllDuas: Stack trace: $stackTrace');
      return [];
    }
  }

  Future<bool> validateDatabase() async {
    print('validateDatabase: Checking database schema...');
    try {
      // Try a simple count query first to see if the database is accessible
      final count = await (select(duas)..limit(1)).get();
      print(
          'validateDatabase: Successfully queried database, found ${count.length} records');
      return true;
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

  Future<List<Dua>> getDuasByCategory(int categoryId) => (select(duas)
        ..where((t) => t.categoryId.equals(categoryId))
        ..orderBy([(t) => OrderingTerm(expression: t.id)]))
      .get();

  Future<Dua> getDuaById(int id) =>
      (select(duas)..where((t) => t.id.equals(id))).getSingle();
}