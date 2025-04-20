import 'package:dua/domain/repositories/subcategory_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDuaNamesBySubcategoryIdUseCase {
  final SubcategoryRepository subcategoryRepository;

  GetDuaNamesBySubcategoryIdUseCase({required this.subcategoryRepository});

  Future<Either<String, Map<int, List<String>>>> call() async {
    try {
      final subcategoryNames =
          await subcategoryRepository.getDuaNamesBySubcategoryId();
      return right(subcategoryNames);
    } catch (e) {
      return left(e.toString());
    }
  }
}
