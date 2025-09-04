import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDuasLightByCategoryUseCase {
  final DuaRepository duaRepository;

  GetDuasLightByCategoryUseCase({required this.duaRepository});

  Future<Either<String, List<Map<String, dynamic>>>> call(int categoryId,
      {bool forceRefresh = false}) async {
    try {
      final duas = await duaRepository.getDuasLightByCategory(categoryId,
          forceRefresh: forceRefresh);
      return Right(duas);
    } catch (e) {
      return Left('Failed to get duas by category: $e');
    }
  }
}
