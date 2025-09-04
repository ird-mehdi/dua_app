import 'package:dua/data/models/category_model.dart';
import 'package:dua/domain/entities/category_entity.dart';
import 'package:dua/data/services/dua_database/database_service.dart';

class CategoryMapper {
  static CategoryEntity fromDb(Category category) {
    return CategoryEntity(
      id: category.id,
      languageId: category.languageId,
      name: category.name,
      slug: category.slug,
      icon: category.icon,
    );
  }

  static List<CategoryEntity> fromDbList(List<Category> categories) {
    return categories.map((category) => fromDb(category)).toList();
  }

  static CategoryModel fromDbToModel(Category category) {
    return CategoryModel(
      id: category.id,
      languageId: category.languageId,
      name: category.name,
      slug: category.slug,
      icon: category.icon,
    );
  }

  static List<CategoryModel> fromDbToModelList(List<Category> categories) {
    return categories.map((category) => fromDbToModel(category)).toList();
  }

  static CategoryEntity fromModel(CategoryModel model) {
    return model.toEntity();
  }

  static List<CategoryEntity> fromModelList(List<CategoryModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
