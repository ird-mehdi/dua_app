import 'package:dua/domain/entities/dua_entity.dart';

abstract class DuaRepository {
  Future<List<DuaEntity>> getAllDua();
}

