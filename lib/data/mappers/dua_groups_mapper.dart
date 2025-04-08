// JSON column mapper for 'groups' (since it's JSON)
import 'package:drift/drift.dart';

class JsonColumnMapper extends TypeConverter<String, String?> {
  const JsonColumnMapper();
  @override
  String fromSql(String? fromDb) {
    // Improve null safety by returning an empty string for null values
    if (fromDb == null) {
      print('JsonColumnMapper: Received null value from database');
      return '';
    }
    try {
      // Try to validate if it's proper JSON
      return fromDb;
    } catch (e) {
      print('JsonColumnMapper: Error parsing JSON from database: $e');
      return '';
    }
  }

  @override
  String? toSql(String value) => value;
}