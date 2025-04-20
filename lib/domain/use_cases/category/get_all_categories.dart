import 'package:dua/domain/entities/category_entity.dart';
import 'package:dua/domain/repositories/category_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository categoryRepository;

  GetAllCategoriesUseCase({required this.categoryRepository});

  Future<Either<String, List<CategoryEntity>>> call() async {
    try {
      final categories = await categoryRepository.getAllCategories();
      return right(categories);
    } catch (e) {
      return left(e.toString());
    }
  }
}
