import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllDuaUseCase {
  final DuaRepository duaRepository;

  GetAllDuaUseCase({required this.duaRepository});

  Future<Either<String, List<DuaEntity>>> call() async {
    try {
      // Get all subcategories data in a map
      final map = await duaRepository.getDuasGroupedBySubcategory();

      // Flatten the map to a list
      final List<DuaEntity> allDuas = [];
      for (final subcategoryDuas in map.values) {
        allDuas.addAll(subcategoryDuas);
      }

      return right(allDuas);
    } catch (e) {
      return left(e.toString());
    }
  }
}
