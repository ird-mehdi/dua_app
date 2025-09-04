import 'package:drift/drift.dart';
import 'package:dua/data/mappers/dua_groups_mapper.dart';

class Duas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get languageId => text().nullable()();
  TextColumn get groups => text().map(const JsonColumnMapper()).nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get context => text().nullable()();
  TextColumn get source => text().nullable()();
  TextColumn get indopak => text().nullable()();
  TextColumn get clean => text().nullable()();
  TextColumn get transliteration => text().nullable()();
  TextColumn get translation => text().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get reference => text().nullable()();
  IntColumn get audio => integer().nullable()();
  IntColumn get categoryId => integer().nullable()();
  IntColumn get subcategoryId => integer().nullable()();
}