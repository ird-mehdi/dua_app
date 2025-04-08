import 'dart:io';
import 'package:dua/core/constants/app_constant.dart';
import 'package:dua/core/utility/trial_utility.dart';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

LazyDatabase loadDatabase() => LazyDatabase(_openConnection);

Future<bool> isDatabaseFileFound() async {
  final bool? isDatabaseFileFound = await catchAndReturnFuture(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, AppConstant.dbName));
    return file.exists();
  });
  return isDatabaseFileFound ?? false;
}

Future<void> deleteDatabaseFile() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, AppConstant.dbName));
  if (file.existsSync()) {
    file.deleteSync();
  }
}

Future<QueryExecutor> _openConnection() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, AppConstant.dbName));

  print('_openConnection: Database path: ${file.path}');

  // Check if we need to copy the database
  if (!file.existsSync()) {
    print('_openConnection: Database file not found, copying from assets...');
    try {
      // Create the parent directory if it doesn't exist
      file.parent.createSync(recursive: true);

      // Check if the asset exists
      print(
          '_openConnection: Looking for asset at: ${AppConstant.dbAssetPath}');
      try {
        // Copy database file from assets - use the correct path from AppConstant
        final ByteData data = await rootBundle.load(AppConstant.dbAssetPath);
        print(
            '_openConnection: Asset loaded successfully, size: ${data.lengthInBytes} bytes');

        final List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await file.writeAsBytes(bytes);

        print(
            '_openConnection: Database copied successfully, file size: ${await file.length()} bytes');
      } catch (e) {
        print('_openConnection: ERROR loading asset: $e');

        // Try with alternate path as fallback
        try {
          print(
              '_openConnection: Trying with alternate path: assets/database/quran.db');
          final ByteData data =
              await rootBundle.load('assets/database/quran.db');
          print(
              '_openConnection: Asset loaded successfully with alternate path, size: ${data.lengthInBytes} bytes');

          final List<int> bytes =
              data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
          await file.writeAsBytes(bytes);

          print(
              '_openConnection: Database copied successfully with alternate path, file size: ${await file.length()} bytes');
        } catch (e2) {
          print(
              '_openConnection: CRITICAL ERROR loading asset with alternate path: $e2');

          try {
            print(
                '_openConnection: Last attempt with direct filename: database.sqlite');
            final ByteData data =
                await rootBundle.load('assets/database/database.sqlite');
            print(
                '_openConnection: Asset loaded successfully with direct filename, size: ${data.lengthInBytes} bytes');

            final List<int> bytes =
                data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            await file.writeAsBytes(bytes);

            print(
                '_openConnection: Database copied successfully with direct filename, file size: ${await file.length()} bytes');
          } catch (e3) {
            print(
                '_openConnection: ALL ATTEMPTS FAILED. Creating empty database file as fallback');
            await file.writeAsString('');
          }
        }
      }
    } catch (e, stackTrace) {
      print('_openConnection: Exception during database setup: $e');
      print('_openConnection: Stack trace: $stackTrace');
    }
  } else {
    final fileSize = await file.length();
    print(
        '_openConnection: Database file already exists, size: $fileSize bytes');
    if (fileSize == 0) {
      print('_openConnection: WARNING - Database file exists but is empty!');
    }
  }

  print('_openConnection: Opening database at: ${file.path}');
  return NativeDatabase.createInBackground(file);
}