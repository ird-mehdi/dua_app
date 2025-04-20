import 'package:dua/domain/entities/subcategory_entity.dart';

abstract class SubcategoryRepository {
  Future<List<SubcategoryEntity>> getAllSubcategories();
  Future<List<SubcategoryEntity>> getSubcategoriesByCategory(int categoryId);
  Future<Map<int, List<String>>> getSubcategoryNamesByCategoryId();
  Future<Map<int, List<String>>> getDuaNamesBySubcategoryId();

  Future<List<String>> getSubcategoryNamesByCategory(int categoryId);
}
