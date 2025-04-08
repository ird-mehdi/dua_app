import 'package:dua/data/services/dua_database/database_service.dart';

abstract class LocalDataSource {
  Future<List<Dua>> getDuas();
}

class LocalDataSourceImpl extends LocalDataSource {
  final DuaDatabase databaseService;

  LocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<Dua>> getDuas() async {
    return await databaseService.getAllDuas();
  }
}
