import 'package:dua/domain/entities/category_entity.dart';

class CategoryModel {
  final int id;
  final String languageId;
  final String name;
  final String slug;
  final String icon;

  CategoryModel({
    required this.id,
    required this.languageId,
    required this.name,
    required this.slug,
    required this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      languageId: json['language_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'language_id': languageId,
      'name': name,
      'slug': slug,
      'icon': icon,
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      languageId: languageId,
      name: name,
      slug: slug,
      icon: icon,
    );
  }
}
