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
      print('DuaRepositoryImpl: Getting all duas');
      final duas = await localDataSource.getDuas();
      print('DuaRepositoryImpl: Received ${duas.length} duas from data source');

      if (duas.isEmpty) {
        print('DuaRepositoryImpl: No duas returned from data source');
        return [];
      }

      // Use the mapper to convert DTOs to entities
      final entities = DuaMapper.fromDtoList(duas);

      print('DuaRepositoryImpl: Converted ${entities.length} duas to entities');

      // Log first entity to confirm data
      if (entities.isNotEmpty) {
        print('DuaRepositoryImpl: First dua: ${entities[0].name}');
      }

      return entities;
    } catch (e) {
      print('Error in DuaRepositoryImpl.getAllDua: $e');
      return [];
    }
  }
}
