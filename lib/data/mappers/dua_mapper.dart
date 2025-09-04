import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/data/services/dua_database/database_service.dart';

class DuaMapper {
  const DuaMapper();

  static DuaEntity fromDto(Dua dua) {
    return DuaEntity(
      id: dua.id,
      languageId: dua.languageId ?? '',
      groups: dua.groups,
      name: dua.name ?? '',
      context: dua.context ?? '',
      source: dua.source ?? '',
      indopak: dua.indopak ?? '',
      clean: dua.clean ?? '',
      transliteration: dua.transliteration ?? '',
      translation: dua.translation ?? '',
      note: dua.note ?? '',
      reference: dua.reference ?? '',
      audio: dua.audio ?? 0,
      categoryId: dua.categoryId ?? 0,
      subcategoryId: dua.subcategoryId ?? 0,
    );
  }

  static List<DuaEntity> fromDtoList(List<Dua> duas) {
    return duas.map((dua) => fromDto(dua)).toList();
  }

  static DuaEntity fromJson(Map<String, dynamic> json) {
    return DuaEntity(
      id: json['id'],
      name: json['name'],
      languageId: json['languageId'],
      groups: json['groups'],
      context: json['context'],
      source: json['source'],
      indopak: json['indopak'],
      clean: json['clean'],
      transliteration: json['transliteration'],
      translation: json['translation'],
      note: json['note'],
      reference: json['reference'],
      audio: json['audio'],
      categoryId: json['categoryId'],
      subcategoryId: json['subcategoryId'],
    );
  }
}
