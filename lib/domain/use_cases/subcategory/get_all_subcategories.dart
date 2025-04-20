import 'package:dua/domain/entities/subcategory_entity.dart';
import 'package:dua/domain/repositories/subcategory_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllSubcategoriesUseCase {
  final SubcategoryRepository subcategoryRepository;

  GetAllSubcategoriesUseCase({required this.subcategoryRepository});

  Future<Either<String, List<SubcategoryEntity>>> call() async {
    try {
      final subcategories = await subcategoryRepository.getAllSubcategories();
      return right(subcategories);
    } catch (e) {
      return left(e.toString());
    }
  }
}
