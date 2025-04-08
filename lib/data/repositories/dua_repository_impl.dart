import 'package:dua/data/datasource/local_data_source.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_repository.dart';

class DuaRepositoryImpl extends DuaRepository {
  final LocalDataSource localDataSource;

  DuaRepositoryImpl({required this.localDataSource});

  @override
  Future<List<DuaEntity>> getAllDua() async {
    return [
    ];
  }
}
