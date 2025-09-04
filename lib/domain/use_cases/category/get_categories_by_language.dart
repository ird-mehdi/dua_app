import 'package:dua/domain/entities/category_entity.dart';
import 'package:dua/domain/repositories/category_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCategoriesByLanguageUseCase {
  final CategoryRepository categoryRepository;

  GetCategoriesByLanguageUseCase({required this.categoryRepository});

  Future<Either<String, List<CategoryEntity>>> call(String languageId) async {
    try {
      final categories =
          await categoryRepository.getCategoriesByLanguage(languageId);
      return right(categories);
    } catch (e) {
      return left(e.toString());
    }
  }
}
