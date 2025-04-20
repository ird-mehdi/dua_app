import 'package:drift/drift.dart';

class Subcategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get languageId => text().named('language_id')();
  TextColumn get name => text()();
  IntColumn get categoryId => integer().named('category_id')();
}
