import 'package:dua/data/models/subcategory_model.dart';
import 'package:dua/domain/entities/subcategory_entity.dart';
import 'package:dua/data/services/dua_database/database_service.dart';

class SubcategoryMapper {
  static SubcategoryEntity fromDb(Subcategory subcategory) {
    return SubcategoryEntity(
      id: subcategory.id,
      languageId: subcategory.languageId,
      name: subcategory.name,
      categoryId: subcategory.categoryId,
    );
  }

  static List<SubcategoryEntity> fromDbList(List<Subcategory> subcategories) {
    return subcategories.map((subcategory) => fromDb(subcategory)).toList();
  }

  static SubcategoryModel fromDbToModel(Subcategory subcategory) {
    return SubcategoryModel(
      id: subcategory.id,
      languageId: subcategory.languageId,
      name: subcategory.name,
      categoryId: subcategory.categoryId,
    );
  }

  static List<SubcategoryModel> fromDbToModelList(
      List<Subcategory> subcategories) {
    return subcategories
        .map((subcategory) => fromDbToModel(subcategory))
        .toList();
  }

  static SubcategoryEntity fromModel(SubcategoryModel model) {
    return model.toEntity();
  }

  static List<SubcategoryEntity> fromModelList(List<SubcategoryModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
