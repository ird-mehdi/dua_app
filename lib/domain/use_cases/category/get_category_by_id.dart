import 'package:dua/domain/entities/category_entity.dart';
import 'package:dua/domain/repositories/category_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCategoryByIdUseCase {
  final CategoryRepository categoryRepository;

  GetCategoryByIdUseCase({required this.categoryRepository});

  Future<Either<String, CategoryEntity?>> call(int id) async {
    try {
      final category = await categoryRepository.getCategoryById(id);
      return right(category);
    } catch (e) {
      return left(e.toString());
    }
  }
}
