import 'package:dua/data/services/dua_database/database_service.dart';

abstract class LocalDataSource {
  Future<List<Dua>> getDuas();
  Future<List<Category>> getCategories();
  Future<Category?> getCategoryById(int id);
  Future<List<Subcategory>> getSubcategories();
  Future<List<Subcategory>> getSubcategoriesByCategory(int categoryId);
}

class LocalDataSourceImpl extends LocalDataSource {
  final DuaDatabase databaseService;

  LocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<Dua>> getDuas() async {
    try {
      final duas = await databaseService.getAllDuas();
      return duas;
    } catch (e) {
      // Return empty list instead of propagating error
      return [];
    }
  }

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
}
