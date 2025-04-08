import 'package:dua/data/services/dua_database/database_service.dart';

abstract class LocalDataSource {
  Future<List<Dua>> getDuas();
}

class LocalDataSourceImpl extends LocalDataSource {
  final DuaDatabase databaseService;

  LocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<Dua>> getDuas() async {
    try {
      print('LocalDataSource: Getting duas from database');

      final duas = await databaseService.getAllDuas();
      print('LocalDataSource: Retrieved ${duas.length} duas');

      return duas;
    } catch (e) {
      print('LocalDataSource: Error getting duas: $e');
      // Return empty list instead of propagating error
      return [];
    }
  }
}
