import 'package:dua/data/datasource/local_data_source.dart';
import 'package:dua/data/mappers/dua_mapper.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_repository.dart';

class DuaRepositoryImpl extends DuaRepository {
  final LocalDataSource localDataSource;

  DuaRepositoryImpl({required this.localDataSource});

  @override
  Future<List<DuaEntity>> getAllDua() async {
    try {
      final duas = await localDataSource.getDuas();

      if (duas.isEmpty) {
        return [];
      }

      // Use the mapper to convert DTOs to entities
      final entities = DuaMapper.fromDtoList(duas);


      // Log first entity to confirm data
      if (entities.isNotEmpty) {
      }

      return entities;
    } catch (e) {
      return [];
    }
  }
}
