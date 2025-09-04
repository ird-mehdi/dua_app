import 'dart:io';
import 'dart:isolate';
import 'package:dua/core/constants/app_constant.dart';
import 'package:dua/core/utility/trial_utility.dart';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:dua/data/services/dua_database/database_service.dart';

// Using DriftIsolate to run database operations in a background isolate
LazyDatabase loadDatabase() {
  return LazyDatabase(() async {
    // Get the database file path
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, AppConstant.dbName));

    // Create database file if it doesn't exist
    if (!file.existsSync()) {
      await _copyDatabaseFromAssets(file);
    } else if (await file.length() == 0) {
      await _copyDatabaseFromAssets(file);
    }

    // Create a DriftIsolate
    final isolate = await _createDriftIsolate(file.path);
    final connection = await isolate.connect();

    // IMPORTANT: Don't add a cleanup handler here that could close the connection
    // This was causing the "connection was closed" error
    // The connection will be closed when the database is disposed

    return connection;
  });
}

// Create a DriftIsolate that will run database operations in a background isolate
Future<DriftIsolate> _createDriftIsolate(String path) async {
  final receivePort = ReceivePort();
  final id = 'db_isolate_${DateTime.now().millisecondsSinceEpoch}';

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  // Wait for the isolate to send us the DriftIsolate
  final isolate = await receivePort.first as DriftIsolate;

  // Track this isolate for proper cleanup
  DuaDatabase.trackIsolate(id, isolate, receivePort);

  return isolate;
}

// The background isolate entry point
void _startBackground(_IsolateStartRequest request) {
  // Create a database connection in the background isolate
  final executor = NativeDatabase(File(request.path));
  // Create and send back the drift isolate
  final driftIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection(executor),
    killIsolateWhenDone: true,
  );
  request.sendPort.send(driftIsolate);
}

// Data class for the isolate request
class _IsolateStartRequest {
  final SendPort sendPort;
  final String path;

  _IsolateStartRequest(this.sendPort, this.path);
}

Future<void> _copyDatabaseFromAssets(File file) async {
  try {
    // Create the parent directory if it doesn't exist
    file.parent.createSync(recursive: true);

    // Try to load from primary path
    try {
      final ByteData data = await rootBundle.load(AppConstant.dbAssetPath);
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await file.writeAsBytes(bytes);
    } catch (e) {
      // Try alternate paths as fallback
      try {
        final ByteData data =
            await rootBundle.load('assets/databases/database.sqlite');
        final List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await file.writeAsBytes(bytes);
      } catch (e2) {
        try {
          final ByteData data =
              await rootBundle.load('assets/database/database.sqlite');
          final List<int> bytes =
              data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
          await file.writeAsBytes(bytes);
        } catch (e3) {
          await file.writeAsString('');
        }
      }
    }
  } catch (e) {
    // Silently catching initialization error since fallback options have been tried
  }
}

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
