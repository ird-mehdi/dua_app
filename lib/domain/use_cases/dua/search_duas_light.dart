import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:fpdart/fpdart.dart';

class SearchDuasLightUseCase {
  final DuaRepository duaRepository;

  SearchDuasLightUseCase({required this.duaRepository});

  Future<Either<String, List<Map<String, dynamic>>>> call(String query,
      {bool forceRefresh = false}) async {
    try {
      if (query.isEmpty) {
        return const Right([]);
      }

      final results = await duaRepository.searchDuasLight(
        query,
        forceRefresh: forceRefresh,
      );
      return Right(results);
    } catch (e) {
      return Left('Failed to search duas: $e');
    }
  }
}
