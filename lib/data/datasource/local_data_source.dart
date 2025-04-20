import 'package:dua/data/services/dua_database/database_service.dart';

abstract class LocalDataSource {
  Future<List<Category>> getCategories();
  Future<Category?> getCategoryById(int id);
  Future<List<Subcategory>> getSubcategories();
  Future<List<Subcategory>> getSubcategoriesByCategory(int categoryId);
  Future<Map<String, dynamic>?> getDuaLightById(int id,
      {bool forceRefresh = false});
  Future<List<Map<String, dynamic>>> getDuasLightByCategory(int categoryId,
      {bool forceRefresh = false});
  Future<List<Map<String, dynamic>>> searchDuasLight(String query,
      {bool forceRefresh = false});
}

class LocalDataSourceImpl extends LocalDataSource {
  final DuaDatabase databaseService;

  LocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<Category>> getCategories() async {
    try {
      final results = await databaseService.getAllCategories();
      return results;
    } catch (e) {
      // Return empty list instead of propagating error
      return [];
    }
  }

  @override
  Future<Category?> getCategoryById(int id) async {
    try {
      final category = await databaseService.getCategoryById(id);
      return category;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Subcategory>> getSubcategories() async {
    try {
      final results = await databaseService.getAllSubcategories();
      return results;
    } catch (e) {
      // Return empty list instead of propagating error
      return [];
    }
  }

  @override
  Future<List<Subcategory>> getSubcategoriesByCategory(int categoryId) async {
    try {
      final results =
          await databaseService.getSubcategoriesByCategory(categoryId);
      return results;
    } catch (e) {
      // Return empty list instead of propagating error
      return [];
    }
  }

  @override
  Future<Map<String, dynamic>?> getDuaLightById(int id,
      {bool forceRefresh = false}) async {
    try {
      final dua =
          await databaseService.getDuaLightById(id, forceRefresh: forceRefresh);
      return dua;
    } catch (e) {
      // Return null instead of propagating error
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getDuasLightByCategory(int categoryId,
      {bool forceRefresh = false}) async {
    try {
      final results = await databaseService.getDuasLightByCategory(categoryId,
          forceRefresh: forceRefresh);
      return results;
    } catch (e) {
      // Return empty list instead of propagating error
      return [];
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchDuasLight(String query,
      {bool forceRefresh = false}) async {
    try {
      final results = await databaseService.searchDuasLight(query,
          forceRefresh: forceRefresh);
      return results;
    } catch (e) {
      // Return empty list instead of propagating error
      return [];
    }
  }
}
