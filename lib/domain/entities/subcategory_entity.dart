import 'package:equatable/equatable.dart';

class SubcategoryEntity extends Equatable {
  final int id;
  final String languageId;
  final String name;
  final int categoryId;

  const SubcategoryEntity({
    required this.id,
    required this.languageId,
    required this.name,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [id, languageId, name, categoryId];
}
