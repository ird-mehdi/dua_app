import 'package:equatable/equatable.dart';
import 'dart:convert';

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

  // Parse the groups JSON string into a list of maps
  List<Map<String, dynamic>> parseGroups() {
    if (groups.isEmpty) {
      return [];
    }

    try {
      // Parse the JSON string into a List of Maps
      final List<dynamic> parsedGroups = jsonDecode(groups);
      return parsedGroups
          .map((group) => group as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error parsing groups JSON: $e');
      return [];
    }
  }

  // Get a specific group object by index
  Map<String, dynamic>? getGroupByIndex(int index) {
    final parsedGroups = parseGroups();
    if (parsedGroups.isEmpty || index >= parsedGroups.length) {
      return null;
    }
    return parsedGroups[index];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'languageId': languageId,
      'groups': groups,
      'name': name,
      'context': context,
      'source': source,
      'indopak': indopak,
      'clean': clean,
      'transliteration': transliteration,
      'translation': translation,
      'note': note,
      'reference': reference,
      'audio': audio,
      'categoryId': categoryId,
      'subcategoryId': subcategoryId,
    };
  }

  factory DuaEntity.fromJson(Map<String, dynamic> json) {
    return DuaEntity(
      id: json['id'] as int,
      languageId: json['languageId'] as String,
      groups: json['groups'] as String,
      name: json['name'] as String,
      context: json['context'] as String,
      source: json['source'] as String,
      indopak: json['indopak'] as String,
      clean: json['clean'] as String,
      transliteration: json['transliteration'] as String,
      translation: json['translation'] as String,
      note: json['note'] as String,
      reference: json['reference'] as String,
      audio: json['audio'] as int,
      categoryId: json['categoryId'] as int,
      subcategoryId: json['subcategoryId'] as int,
    );
  }
}
