import 'package:dua/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getAllCategories();
  Future<CategoryEntity?> getCategoryById(int id);
  Future<List<CategoryEntity>> getCategoriesByLanguage(String languageId);
}
