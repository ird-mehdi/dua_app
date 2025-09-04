import 'package:dua/domain/repositories/subcategory_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSubcategoryNamesByCategoryIdUseCase {
  final SubcategoryRepository subcategoryRepository;

  GetSubcategoryNamesByCategoryIdUseCase({required this.subcategoryRepository});

  Future<Either<String, Map<int, List<String>>>> call() async {
    try {
      final subcategoryNames =
          await subcategoryRepository.getSubcategoryNamesByCategoryId();
      return right(subcategoryNames);
    } catch (e) {
      return left(e.toString());
    }
  }
}
