import 'package:dua/domain/entities/subcategory_entity.dart';

class SubcategoryModel {
  final int id;
  final String languageId;
  final String name;
  final int categoryId;

  SubcategoryModel({
    required this.id,
    required this.languageId,
    required this.name,
    required this.categoryId,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryModel(
      id: json['id'] as int,
      languageId: json['language_id'] as String,
      name: json['name'] as String,
      categoryId: json['category_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'language_id': languageId,
      'name': name,
      'category_id': categoryId,
    };
  }

  SubcategoryEntity toEntity() {
    return SubcategoryEntity(
      id: id,
      languageId: languageId,
      name: name,
      categoryId: categoryId,
    );
  }
}
