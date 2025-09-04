import 'package:dua/domain/entities/subcategory_entity.dart';
import 'package:dua/domain/repositories/subcategory_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSubcategoriesByCategoryUseCase {
  final SubcategoryRepository subcategoryRepository;

  GetSubcategoriesByCategoryUseCase({required this.subcategoryRepository});

  Future<Either<String, List<SubcategoryEntity>>> call(int categoryId) async {
    try {
      final subcategories =
          await subcategoryRepository.getSubcategoriesByCategory(categoryId);
      return right(subcategories);
    } catch (e) {
      return left(e.toString());
    }
  }
}
