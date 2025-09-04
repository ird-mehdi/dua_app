import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String languageId;
  final String name;
  final String slug;
  final String icon;

  const CategoryEntity({
    required this.id,
    required this.languageId,
    required this.name,
    required this.slug,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, languageId, name, slug, icon];
}
