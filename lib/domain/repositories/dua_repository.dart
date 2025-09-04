import 'package:dua/domain/entities/dua_entity.dart';

abstract class DuaRepository {
  /// Returns a map where the key is the subcategory ID and the value is a list of duas in that subcategory
  Future<Map<int, List<DuaEntity>>> getDuasGroupedBySubcategory();

  /// Get lightweight dua data by ID
  Future<Map<String, dynamic>?> getDuaLightById(int id,
      {bool forceRefresh = false});

  /// Get lightweight duas by category ID
  Future<List<Map<String, dynamic>>> getDuasLightByCategory(int categoryId,
      {bool forceRefresh = false});

  /// Search lightweight duas by query string
  Future<List<Map<String, dynamic>>> searchDuasLight(String query,
      {bool forceRefresh = false});
}
