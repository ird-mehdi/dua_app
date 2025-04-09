import 'package:equatable/equatable.dart';

class DuaEntity extends Equatable {
  final int id;
  final String languageId;
  final String groups;
  final String name;
  final String context;
  final String source;
  final String indopak;
  final String clean;
  final String transliteration;
  final String translation;
  final String note;
  final String reference;
  final int audio;
  final int categoryId;
  final int subcategoryId;

  const DuaEntity({
    required this.id,
    required this.languageId,
    required this.groups,
    required this.name,
    required this.context,
    required this.source,
    required this.indopak,
    required this.clean,
    required this.transliteration,
    required this.translation,
    required this.note,
    required this.reference,
    required this.audio,
    required this.categoryId,
    required this.subcategoryId,
  });


  factory DuaEntity.empty() {
    return DuaEntity(
      id: 0,
      languageId: '',
      groups: '',
      name: '',
      context: '',
      source: '',
      indopak: '',
      clean: '',
      transliteration: '',
      translation: '',
      note: '',
      reference: '',
      audio: 0,
      categoryId: 0,
      subcategoryId: 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        languageId,
        groups,
        name,
        context,
        source,
        indopak,
        clean,
        transliteration,
        translation,
        note,
        reference,
        audio,
        categoryId,
        subcategoryId,
      ];

  DuaEntity copyWith({
    int? id,
    String? languageId,
    String? groups,
    String? name,
    String? context,
    String? source,
    String? indopak,
    String? clean,
    String? transliteration,
    String? translation,
    String? note,
    String? reference,
    int? audio,
    int? categoryId,
    int? subcategoryId,
  }) {
    return DuaEntity(
      id: id ?? this.id,
      languageId: languageId ?? this.languageId,
      groups: groups ?? this.groups,
      name: name ?? this.name,
      context: context ?? this.context,
      source: source ?? this.source,
      indopak: indopak ?? this.indopak,
      clean: clean ?? this.clean,
      transliteration: transliteration ?? this.transliteration,
      translation: translation ?? this.translation,
      note: note ?? this.note,
      reference: reference ?? this.reference,
      audio: audio ?? this.audio,
      categoryId: categoryId ?? this.categoryId,
      subcategoryId: subcategoryId ?? this.subcategoryId,
    );
  }
}
