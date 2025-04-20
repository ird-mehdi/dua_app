import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get languageId => text().named('language_id')();
  TextColumn get name => text()();
  TextColumn get slug => text()();
  TextColumn get icon => text()();
}
