import 'package:dua/domain/entities/dua_entity.dart';

class DuaMapper extends DuaEntity {
  const DuaMapper({
    required super.id,
    required super.name,
    required super.languageId,
    required super.groups,
    required super.context,
    required super.source,
    required super.indopak,
    required super.clean,
    required super.transliteration,
    required super.translation,
    required super.note,
    required super.reference,
    required super.audio,
    required super.categoryId,
    required super.subcategoryId,
  });

  static DuaMapper fromJson(Map<String, dynamic> json) {
    return DuaMapper(
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
