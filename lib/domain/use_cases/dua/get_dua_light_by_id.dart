import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDuaLightByIdUseCase {
  final DuaRepository duaRepository;

  GetDuaLightByIdUseCase({required this.duaRepository});

  Future<Either<String, Map<String, dynamic>?>> call(int id,
      {bool forceRefresh = false}) async {
    try {
      final dua =
          await duaRepository.getDuaLightById(id, forceRefresh: forceRefresh);
      return Right(dua);
    } catch (e) {
      return Left('Failed to get dua: $e');
    }
  }
}
