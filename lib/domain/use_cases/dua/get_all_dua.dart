import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllDuaUseCase {
  final DuaRepository duaRepository;

  GetAllDuaUseCase({required this.duaRepository});

  Future<Either<String, List<DuaEntity>>> call() async {
    try {
      final dua = await duaRepository.getAllDua();
      return right(dua);
    } catch (e) {
      return left(e.toString());
    }
  }
}

