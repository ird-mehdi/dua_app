import 'package:dua/domain/entities/dua_entity.dart';

abstract class DuaRepository {
  Future<List<DuaEntity>> getAllDua();

  /// Returns a map where the key is the subcategory ID and the value is a list of duas in that subcategory
  Future<Map<int, List<DuaEntity>>> getDuasGroupedBySubcategory();
}
