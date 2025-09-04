import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDuasGroupedBySubcategoryUseCase {
  final DuaRepository duaRepository;

  GetDuasGroupedBySubcategoryUseCase({required this.duaRepository});

  /// Returns a map where the key is the subcategory ID and the value is a list of duas in that subcategory
  Future<Either<String, Map<int, List<DuaEntity>>>> call() async {
    try {
      final groupedDuas = await duaRepository.getDuasGroupedBySubcategory();
      return right(groupedDuas);
    } catch (e) {
      return left(e.toString());
    }
  }
}
