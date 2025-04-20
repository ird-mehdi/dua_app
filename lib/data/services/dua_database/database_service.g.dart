// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// ignore_for_file: type=lint
class $DuasTable extends Duas with TableInfo<$DuasTable, Dua> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DuasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _languageIdMeta =
      const VerificationMeta('languageId');
  @override
  late final GeneratedColumn<String> languageId = GeneratedColumn<String>(
      'language_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<String, String> groups =
      GeneratedColumn<String>('groups', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<String>($DuasTable.$convertergroups);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contextMeta =
      const VerificationMeta('context');
  @override
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
      'context', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _indopakMeta =
      const VerificationMeta('indopak');
  @override
  late final GeneratedColumn<String> indopak = GeneratedColumn<String>(
      'indopak', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cleanMeta = const VerificationMeta('clean');
  @override
  late final GeneratedColumn<String> clean = GeneratedColumn<String>(
      'clean', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transliterationMeta =
      const VerificationMeta('transliteration');
  @override
  late final GeneratedColumn<String> transliteration = GeneratedColumn<String>(
      'transliteration', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _referenceMeta =
      const VerificationMeta('reference');
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
      'reference', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioMeta = const VerificationMeta('audio');
  @override
  late final GeneratedColumn<int> audio = GeneratedColumn<int>(
      'audio', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subcategoryIdMeta =
      const VerificationMeta('subcategoryId');
  @override
  late final GeneratedColumn<int> subcategoryId = GeneratedColumn<int>(
      'subcategory_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
        subcategoryId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'duas';
  @override
  VerificationContext validateIntegrity(Insertable<Dua> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id']!, _languageIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('context')) {
      context.handle(_contextMeta,
          this.context.isAcceptableOrUnknown(data['context']!, _contextMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('indopak')) {
      context.handle(_indopakMeta,
          indopak.isAcceptableOrUnknown(data['indopak']!, _indopakMeta));
    }
    if (data.containsKey('clean')) {
      context.handle(
          _cleanMeta, clean.isAcceptableOrUnknown(data['clean']!, _cleanMeta));
    }
    if (data.containsKey('transliteration')) {
      context.handle(
          _transliterationMeta,
          transliteration.isAcceptableOrUnknown(
              data['transliteration']!, _transliterationMeta));
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('reference')) {
      context.handle(_referenceMeta,
          reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta));
    }
    if (data.containsKey('audio')) {
      context.handle(
          _audioMeta, audio.isAcceptableOrUnknown(data['audio']!, _audioMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('subcategory_id')) {
      context.handle(
          _subcategoryIdMeta,
          subcategoryId.isAcceptableOrUnknown(
              data['subcategory_id']!, _subcategoryIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dua map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dua(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      languageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_id']),
      groups: $DuasTable.$convertergroups.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}groups'])),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      context: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
      indopak: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}indopak']),
      clean: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clean']),
      transliteration: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transliteration']),
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      reference: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference']),
      audio: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audio']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      subcategoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subcategory_id']),
    );
  }

  @override
  $DuasTable createAlias(String alias) {
    return $DuasTable(attachedDatabase, alias);
  }

  static TypeConverter<String, String?> $convertergroups =
      const JsonColumnMapper();
}

class Dua extends DataClass implements Insertable<Dua> {
  final int id;
  final String? languageId;
  final String groups;
  final String? name;
  final String? context;
  final String? source;
  final String? indopak;
  final String? clean;
  final String? transliteration;
  final String? translation;
  final String? note;
  final String? reference;
  final int? audio;
  final int? categoryId;
  final int? subcategoryId;
  const Dua(
      {required this.id,
      this.languageId,
      required this.groups,
      this.name,
      this.context,
      this.source,
      this.indopak,
      this.clean,
      this.transliteration,
      this.translation,
      this.note,
      this.reference,
      this.audio,
      this.categoryId,
      this.subcategoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<String>(languageId);
    }
    {
      map['groups'] =
          Variable<String>($DuasTable.$convertergroups.toSql(groups));
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || context != null) {
      map['context'] = Variable<String>(context);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || indopak != null) {
      map['indopak'] = Variable<String>(indopak);
    }
    if (!nullToAbsent || clean != null) {
      map['clean'] = Variable<String>(clean);
    }
    if (!nullToAbsent || transliteration != null) {
      map['transliteration'] = Variable<String>(transliteration);
    }
    if (!nullToAbsent || translation != null) {
      map['translation'] = Variable<String>(translation);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || audio != null) {
      map['audio'] = Variable<int>(audio);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || subcategoryId != null) {
      map['subcategory_id'] = Variable<int>(subcategoryId);
    }
    return map;
  }

  DuasCompanion toCompanion(bool nullToAbsent) {
    return DuasCompanion(
      id: Value(id),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      groups: Value(groups),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      context: context == null && nullToAbsent
          ? const Value.absent()
          : Value(context),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      indopak: indopak == null && nullToAbsent
          ? const Value.absent()
          : Value(indopak),
      clean:
          clean == null && nullToAbsent ? const Value.absent() : Value(clean),
      transliteration: transliteration == null && nullToAbsent
          ? const Value.absent()
          : Value(transliteration),
      translation: translation == null && nullToAbsent
          ? const Value.absent()
          : Value(translation),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      audio:
          audio == null && nullToAbsent ? const Value.absent() : Value(audio),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      subcategoryId: subcategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(subcategoryId),
    );
  }

  factory Dua.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dua(
      id: serializer.fromJson<int>(json['id']),
      languageId: serializer.fromJson<String?>(json['languageId']),
      groups: serializer.fromJson<String>(json['groups']),
      name: serializer.fromJson<String?>(json['name']),
      context: serializer.fromJson<String?>(json['context']),
      source: serializer.fromJson<String?>(json['source']),
      indopak: serializer.fromJson<String?>(json['indopak']),
      clean: serializer.fromJson<String?>(json['clean']),
      transliteration: serializer.fromJson<String?>(json['transliteration']),
      translation: serializer.fromJson<String?>(json['translation']),
      note: serializer.fromJson<String?>(json['note']),
      reference: serializer.fromJson<String?>(json['reference']),
      audio: serializer.fromJson<int?>(json['audio']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      subcategoryId: serializer.fromJson<int?>(json['subcategoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageId': serializer.toJson<String?>(languageId),
      'groups': serializer.toJson<String>(groups),
      'name': serializer.toJson<String?>(name),
      'context': serializer.toJson<String?>(context),
      'source': serializer.toJson<String?>(source),
      'indopak': serializer.toJson<String?>(indopak),
      'clean': serializer.toJson<String?>(clean),
      'transliteration': serializer.toJson<String?>(transliteration),
      'translation': serializer.toJson<String?>(translation),
      'note': serializer.toJson<String?>(note),
      'reference': serializer.toJson<String?>(reference),
      'audio': serializer.toJson<int?>(audio),
      'categoryId': serializer.toJson<int?>(categoryId),
      'subcategoryId': serializer.toJson<int?>(subcategoryId),
    };
  }

  Dua copyWith(
          {int? id,
          Value<String?> languageId = const Value.absent(),
          String? groups,
          Value<String?> name = const Value.absent(),
          Value<String?> context = const Value.absent(),
          Value<String?> source = const Value.absent(),
          Value<String?> indopak = const Value.absent(),
          Value<String?> clean = const Value.absent(),
          Value<String?> transliteration = const Value.absent(),
          Value<String?> translation = const Value.absent(),
          Value<String?> note = const Value.absent(),
          Value<String?> reference = const Value.absent(),
          Value<int?> audio = const Value.absent(),
          Value<int?> categoryId = const Value.absent(),
          Value<int?> subcategoryId = const Value.absent()}) =>
      Dua(
        id: id ?? this.id,
        languageId: languageId.present ? languageId.value : this.languageId,
        groups: groups ?? this.groups,
        name: name.present ? name.value : this.name,
        context: context.present ? context.value : this.context,
        source: source.present ? source.value : this.source,
        indopak: indopak.present ? indopak.value : this.indopak,
        clean: clean.present ? clean.value : this.clean,
        transliteration: transliteration.present
            ? transliteration.value
            : this.transliteration,
        translation: translation.present ? translation.value : this.translation,
        note: note.present ? note.value : this.note,
        reference: reference.present ? reference.value : this.reference,
        audio: audio.present ? audio.value : this.audio,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        subcategoryId:
            subcategoryId.present ? subcategoryId.value : this.subcategoryId,
      );
  Dua copyWithCompanion(DuasCompanion data) {
    return Dua(
      id: data.id.present ? data.id.value : this.id,
      languageId:
          data.languageId.present ? data.languageId.value : this.languageId,
      groups: data.groups.present ? data.groups.value : this.groups,
      name: data.name.present ? data.name.value : this.name,
      context: data.context.present ? data.context.value : this.context,
      source: data.source.present ? data.source.value : this.source,
      indopak: data.indopak.present ? data.indopak.value : this.indopak,
      clean: data.clean.present ? data.clean.value : this.clean,
      transliteration: data.transliteration.present
          ? data.transliteration.value
          : this.transliteration,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      note: data.note.present ? data.note.value : this.note,
      reference: data.reference.present ? data.reference.value : this.reference,
      audio: data.audio.present ? data.audio.value : this.audio,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      subcategoryId: data.subcategoryId.present
          ? data.subcategoryId.value
          : this.subcategoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Dua(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('groups: $groups, ')
          ..write('name: $name, ')
          ..write('context: $context, ')
          ..write('source: $source, ')
          ..write('indopak: $indopak, ')
          ..write('clean: $clean, ')
          ..write('transliteration: $transliteration, ')
          ..write('translation: $translation, ')
          ..write('note: $note, ')
          ..write('reference: $reference, ')
          ..write('audio: $audio, ')
          ..write('categoryId: $categoryId, ')
          ..write('subcategoryId: $subcategoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      subcategoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dua &&
          other.id == this.id &&
          other.languageId == this.languageId &&
          other.groups == this.groups &&
          other.name == this.name &&
          other.context == this.context &&
          other.source == this.source &&
          other.indopak == this.indopak &&
          other.clean == this.clean &&
          other.transliteration == this.transliteration &&
          other.translation == this.translation &&
          other.note == this.note &&
          other.reference == this.reference &&
          other.audio == this.audio &&
          other.categoryId == this.categoryId &&
          other.subcategoryId == this.subcategoryId);
}

class DuasCompanion extends UpdateCompanion<Dua> {
  final Value<int> id;
  final Value<String?> languageId;
  final Value<String> groups;
  final Value<String?> name;
  final Value<String?> context;
  final Value<String?> source;
  final Value<String?> indopak;
  final Value<String?> clean;
  final Value<String?> transliteration;
  final Value<String?> translation;
  final Value<String?> note;
  final Value<String?> reference;
  final Value<int?> audio;
  final Value<int?> categoryId;
  final Value<int?> subcategoryId;
  const DuasCompanion({
    this.id = const Value.absent(),
    this.languageId = const Value.absent(),
    this.groups = const Value.absent(),
    this.name = const Value.absent(),
    this.context = const Value.absent(),
    this.source = const Value.absent(),
    this.indopak = const Value.absent(),
    this.clean = const Value.absent(),
    this.transliteration = const Value.absent(),
    this.translation = const Value.absent(),
    this.note = const Value.absent(),
    this.reference = const Value.absent(),
    this.audio = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.subcategoryId = const Value.absent(),
  });
  DuasCompanion.insert({
    this.id = const Value.absent(),
    this.languageId = const Value.absent(),
    this.groups = const Value.absent(),
    this.name = const Value.absent(),
    this.context = const Value.absent(),
    this.source = const Value.absent(),
    this.indopak = const Value.absent(),
    this.clean = const Value.absent(),
    this.transliteration = const Value.absent(),
    this.translation = const Value.absent(),
    this.note = const Value.absent(),
    this.reference = const Value.absent(),
    this.audio = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.subcategoryId = const Value.absent(),
  });
  static Insertable<Dua> custom({
    Expression<int>? id,
    Expression<String>? languageId,
    Expression<String>? groups,
    Expression<String>? name,
    Expression<String>? context,
    Expression<String>? source,
    Expression<String>? indopak,
    Expression<String>? clean,
    Expression<String>? transliteration,
    Expression<String>? translation,
    Expression<String>? note,
    Expression<String>? reference,
    Expression<int>? audio,
    Expression<int>? categoryId,
    Expression<int>? subcategoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageId != null) 'language_id': languageId,
      if (groups != null) 'groups': groups,
      if (name != null) 'name': name,
      if (context != null) 'context': context,
      if (source != null) 'source': source,
      if (indopak != null) 'indopak': indopak,
      if (clean != null) 'clean': clean,
      if (transliteration != null) 'transliteration': transliteration,
      if (translation != null) 'translation': translation,
      if (note != null) 'note': note,
      if (reference != null) 'reference': reference,
      if (audio != null) 'audio': audio,
      if (categoryId != null) 'category_id': categoryId,
      if (subcategoryId != null) 'subcategory_id': subcategoryId,
    });
  }

  DuasCompanion copyWith(
      {Value<int>? id,
      Value<String?>? languageId,
      Value<String>? groups,
      Value<String?>? name,
      Value<String?>? context,
      Value<String?>? source,
      Value<String?>? indopak,
      Value<String?>? clean,
      Value<String?>? transliteration,
      Value<String?>? translation,
      Value<String?>? note,
      Value<String?>? reference,
      Value<int?>? audio,
      Value<int?>? categoryId,
      Value<int?>? subcategoryId}) {
    return DuasCompanion(
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<String>(languageId.value);
    }
    if (groups.present) {
      map['groups'] =
          Variable<String>($DuasTable.$convertergroups.toSql(groups.value));
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (indopak.present) {
      map['indopak'] = Variable<String>(indopak.value);
    }
    if (clean.present) {
      map['clean'] = Variable<String>(clean.value);
    }
    if (transliteration.present) {
      map['transliteration'] = Variable<String>(transliteration.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (audio.present) {
      map['audio'] = Variable<int>(audio.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (subcategoryId.present) {
      map['subcategory_id'] = Variable<int>(subcategoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DuasCompanion(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('groups: $groups, ')
          ..write('name: $name, ')
          ..write('context: $context, ')
          ..write('source: $source, ')
          ..write('indopak: $indopak, ')
          ..write('clean: $clean, ')
          ..write('transliteration: $transliteration, ')
          ..write('translation: $translation, ')
          ..write('note: $note, ')
          ..write('reference: $reference, ')
          ..write('audio: $audio, ')
          ..write('categoryId: $categoryId, ')
          ..write('subcategoryId: $subcategoryId')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _languageIdMeta =
      const VerificationMeta('languageId');
  @override
  late final GeneratedColumn<String> languageId = GeneratedColumn<String>(
      'language_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, languageId, name, slug, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id']!, _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      languageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String languageId;
  final String name;
  final String slug;
  final String icon;
  const Category(
      {required this.id,
      required this.languageId,
      required this.name,
      required this.slug,
      required this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language_id'] = Variable<String>(languageId);
    map['name'] = Variable<String>(name);
    map['slug'] = Variable<String>(slug);
    map['icon'] = Variable<String>(icon);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      languageId: Value(languageId),
      name: Value(name),
      slug: Value(slug),
      icon: Value(icon),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      languageId: serializer.fromJson<String>(json['languageId']),
      name: serializer.fromJson<String>(json['name']),
      slug: serializer.fromJson<String>(json['slug']),
      icon: serializer.fromJson<String>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageId': serializer.toJson<String>(languageId),
      'name': serializer.toJson<String>(name),
      'slug': serializer.toJson<String>(slug),
      'icon': serializer.toJson<String>(icon),
    };
  }

  Category copyWith(
          {int? id,
          String? languageId,
          String? name,
          String? slug,
          String? icon}) =>
      Category(
        id: id ?? this.id,
        languageId: languageId ?? this.languageId,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        icon: icon ?? this.icon,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      languageId:
          data.languageId.present ? data.languageId.value : this.languageId,
      name: data.name.present ? data.name.value : this.name,
      slug: data.slug.present ? data.slug.value : this.slug,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, languageId, name, slug, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.languageId == this.languageId &&
          other.name == this.name &&
          other.slug == this.slug &&
          other.icon == this.icon);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> languageId;
  final Value<String> name;
  final Value<String> slug;
  final Value<String> icon;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.languageId = const Value.absent(),
    this.name = const Value.absent(),
    this.slug = const Value.absent(),
    this.icon = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String languageId,
    required String name,
    required String slug,
    required String icon,
  })  : languageId = Value(languageId),
        name = Value(name),
        slug = Value(slug),
        icon = Value(icon);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? languageId,
    Expression<String>? name,
    Expression<String>? slug,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageId != null) 'language_id': languageId,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (icon != null) 'icon': icon,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? languageId,
      Value<String>? name,
      Value<String>? slug,
      Value<String>? icon}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      languageId: languageId ?? this.languageId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<String>(languageId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $SubcategoriesTable extends Subcategories
    with TableInfo<$SubcategoriesTable, Subcategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubcategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _languageIdMeta =
      const VerificationMeta('languageId');
  @override
  late final GeneratedColumn<String> languageId = GeneratedColumn<String>(
      'language_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, languageId, name, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subcategories';
  @override
  VerificationContext validateIntegrity(Insertable<Subcategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id']!, _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subcategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subcategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      languageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $SubcategoriesTable createAlias(String alias) {
    return $SubcategoriesTable(attachedDatabase, alias);
  }
}

class Subcategory extends DataClass implements Insertable<Subcategory> {
  final int id;
  final String languageId;
  final String name;
  final int categoryId;
  const Subcategory(
      {required this.id,
      required this.languageId,
      required this.name,
      required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language_id'] = Variable<String>(languageId);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  SubcategoriesCompanion toCompanion(bool nullToAbsent) {
    return SubcategoriesCompanion(
      id: Value(id),
      languageId: Value(languageId),
      name: Value(name),
      categoryId: Value(categoryId),
    );
  }

  factory Subcategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subcategory(
      id: serializer.fromJson<int>(json['id']),
      languageId: serializer.fromJson<String>(json['languageId']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageId': serializer.toJson<String>(languageId),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  Subcategory copyWith(
          {int? id, String? languageId, String? name, int? categoryId}) =>
      Subcategory(
        id: id ?? this.id,
        languageId: languageId ?? this.languageId,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
      );
  Subcategory copyWithCompanion(SubcategoriesCompanion data) {
    return Subcategory(
      id: data.id.present ? data.id.value : this.id,
      languageId:
          data.languageId.present ? data.languageId.value : this.languageId,
      name: data.name.present ? data.name.value : this.name,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subcategory(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, languageId, name, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subcategory &&
          other.id == this.id &&
          other.languageId == this.languageId &&
          other.name == this.name &&
          other.categoryId == this.categoryId);
}

class SubcategoriesCompanion extends UpdateCompanion<Subcategory> {
  final Value<int> id;
  final Value<String> languageId;
  final Value<String> name;
  final Value<int> categoryId;
  const SubcategoriesCompanion({
    this.id = const Value.absent(),
    this.languageId = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  SubcategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String languageId,
    required String name,
    required int categoryId,
  })  : languageId = Value(languageId),
        name = Value(name),
        categoryId = Value(categoryId);
  static Insertable<Subcategory> custom({
    Expression<int>? id,
    Expression<String>? languageId,
    Expression<String>? name,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageId != null) 'language_id': languageId,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  SubcategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? languageId,
      Value<String>? name,
      Value<int>? categoryId}) {
    return SubcategoriesCompanion(
      id: id ?? this.id,
      languageId: languageId ?? this.languageId,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<String>(languageId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubcategoriesCompanion(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

abstract class _$DuaDatabase extends GeneratedDatabase {
  _$DuaDatabase(QueryExecutor e) : super(e);
  $DuaDatabaseManager get managers => $DuaDatabaseManager(this);
  late final $DuasTable duas = $DuasTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $SubcategoriesTable subcategories = $SubcategoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [duas, categories, subcategories];
}

typedef $$DuasTableCreateCompanionBuilder = DuasCompanion Function({
  Value<int> id,
  Value<String?> languageId,
  Value<String> groups,
  Value<String?> name,
  Value<String?> context,
  Value<String?> source,
  Value<String?> indopak,
  Value<String?> clean,
  Value<String?> transliteration,
  Value<String?> translation,
  Value<String?> note,
  Value<String?> reference,
  Value<int?> audio,
  Value<int?> categoryId,
  Value<int?> subcategoryId,
});
typedef $$DuasTableUpdateCompanionBuilder = DuasCompanion Function({
  Value<int> id,
  Value<String?> languageId,
  Value<String> groups,
  Value<String?> name,
  Value<String?> context,
  Value<String?> source,
  Value<String?> indopak,
  Value<String?> clean,
  Value<String?> transliteration,
  Value<String?> translation,
  Value<String?> note,
  Value<String?> reference,
  Value<int?> audio,
  Value<int?> categoryId,
  Value<int?> subcategoryId,
});

class $$DuasTableFilterComposer extends Composer<_$DuaDatabase, $DuasTable> {
  $$DuasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<String, String, String> get groups =>
      $composableBuilder(
          column: $table.groups,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get indopak => $composableBuilder(
      column: $table.indopak, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clean => $composableBuilder(
      column: $table.clean, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transliteration => $composableBuilder(
      column: $table.transliteration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reference => $composableBuilder(
      column: $table.reference, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get audio => $composableBuilder(
      column: $table.audio, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subcategoryId => $composableBuilder(
      column: $table.subcategoryId, builder: (column) => ColumnFilters(column));
}

class $$DuasTableOrderingComposer extends Composer<_$DuaDatabase, $DuasTable> {
  $$DuasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groups => $composableBuilder(
      column: $table.groups, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get context => $composableBuilder(
      column: $table.context, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get indopak => $composableBuilder(
      column: $table.indopak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clean => $composableBuilder(
      column: $table.clean, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transliteration => $composableBuilder(
      column: $table.transliteration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reference => $composableBuilder(
      column: $table.reference, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get audio => $composableBuilder(
      column: $table.audio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subcategoryId => $composableBuilder(
      column: $table.subcategoryId,
      builder: (column) => ColumnOrderings(column));
}

class $$DuasTableAnnotationComposer
    extends Composer<_$DuaDatabase, $DuasTable> {
  $$DuasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<String, String> get groups =>
      $composableBuilder(column: $table.groups, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get context =>
      $composableBuilder(column: $table.context, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get indopak =>
      $composableBuilder(column: $table.indopak, builder: (column) => column);

  GeneratedColumn<String> get clean =>
      $composableBuilder(column: $table.clean, builder: (column) => column);

  GeneratedColumn<String> get transliteration => $composableBuilder(
      column: $table.transliteration, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<int> get audio =>
      $composableBuilder(column: $table.audio, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<int> get subcategoryId => $composableBuilder(
      column: $table.subcategoryId, builder: (column) => column);
}

class $$DuasTableTableManager extends RootTableManager<
    _$DuaDatabase,
    $DuasTable,
    Dua,
    $$DuasTableFilterComposer,
    $$DuasTableOrderingComposer,
    $$DuasTableAnnotationComposer,
    $$DuasTableCreateCompanionBuilder,
    $$DuasTableUpdateCompanionBuilder,
    (Dua, BaseReferences<_$DuaDatabase, $DuasTable, Dua>),
    Dua,
    PrefetchHooks Function()> {
  $$DuasTableTableManager(_$DuaDatabase db, $DuasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DuasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DuasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DuasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> languageId = const Value.absent(),
            Value<String> groups = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> context = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<String?> indopak = const Value.absent(),
            Value<String?> clean = const Value.absent(),
            Value<String?> transliteration = const Value.absent(),
            Value<String?> translation = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> reference = const Value.absent(),
            Value<int?> audio = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> subcategoryId = const Value.absent(),
          }) =>
              DuasCompanion(
            id: id,
            languageId: languageId,
            groups: groups,
            name: name,
            context: context,
            source: source,
            indopak: indopak,
            clean: clean,
            transliteration: transliteration,
            translation: translation,
            note: note,
            reference: reference,
            audio: audio,
            categoryId: categoryId,
            subcategoryId: subcategoryId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> languageId = const Value.absent(),
            Value<String> groups = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> context = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<String?> indopak = const Value.absent(),
            Value<String?> clean = const Value.absent(),
            Value<String?> transliteration = const Value.absent(),
            Value<String?> translation = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> reference = const Value.absent(),
            Value<int?> audio = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> subcategoryId = const Value.absent(),
          }) =>
              DuasCompanion.insert(
            id: id,
            languageId: languageId,
            groups: groups,
            name: name,
            context: context,
            source: source,
            indopak: indopak,
            clean: clean,
            transliteration: transliteration,
            translation: translation,
            note: note,
            reference: reference,
            audio: audio,
            categoryId: categoryId,
            subcategoryId: subcategoryId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DuasTableProcessedTableManager = ProcessedTableManager<
    _$DuaDatabase,
    $DuasTable,
    Dua,
    $$DuasTableFilterComposer,
    $$DuasTableOrderingComposer,
    $$DuasTableAnnotationComposer,
    $$DuasTableCreateCompanionBuilder,
    $$DuasTableUpdateCompanionBuilder,
    (Dua, BaseReferences<_$DuaDatabase, $DuasTable, Dua>),
    Dua,
    PrefetchHooks Function()>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String languageId,
  required String name,
  required String slug,
  required String icon,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> languageId,
  Value<String> name,
  Value<String> slug,
  Value<String> icon,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$DuaDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$DuaDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$DuaDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$DuaDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$DuaDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$DuaDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> languageId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> slug = const Value.absent(),
            Value<String> icon = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            languageId: languageId,
            name: name,
            slug: slug,
            icon: icon,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String languageId,
            required String name,
            required String slug,
            required String icon,
          }) =>
              CategoriesCompanion.insert(
            id: id,
            languageId: languageId,
            name: name,
            slug: slug,
            icon: icon,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$DuaDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$DuaDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()>;
typedef $$SubcategoriesTableCreateCompanionBuilder = SubcategoriesCompanion
    Function({
  Value<int> id,
  required String languageId,
  required String name,
  required int categoryId,
});
typedef $$SubcategoriesTableUpdateCompanionBuilder = SubcategoriesCompanion
    Function({
  Value<int> id,
  Value<String> languageId,
  Value<String> name,
  Value<int> categoryId,
});

class $$SubcategoriesTableFilterComposer
    extends Composer<_$DuaDatabase, $SubcategoriesTable> {
  $$SubcategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));
}

class $$SubcategoriesTableOrderingComposer
    extends Composer<_$DuaDatabase, $SubcategoriesTable> {
  $$SubcategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));
}

class $$SubcategoriesTableAnnotationComposer
    extends Composer<_$DuaDatabase, $SubcategoriesTable> {
  $$SubcategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get languageId => $composableBuilder(
      column: $table.languageId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);
}

class $$SubcategoriesTableTableManager extends RootTableManager<
    _$DuaDatabase,
    $SubcategoriesTable,
    Subcategory,
    $$SubcategoriesTableFilterComposer,
    $$SubcategoriesTableOrderingComposer,
    $$SubcategoriesTableAnnotationComposer,
    $$SubcategoriesTableCreateCompanionBuilder,
    $$SubcategoriesTableUpdateCompanionBuilder,
    (
      Subcategory,
      BaseReferences<_$DuaDatabase, $SubcategoriesTable, Subcategory>
    ),
    Subcategory,
    PrefetchHooks Function()> {
  $$SubcategoriesTableTableManager(_$DuaDatabase db, $SubcategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubcategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubcategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubcategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> languageId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
          }) =>
              SubcategoriesCompanion(
            id: id,
            languageId: languageId,
            name: name,
            categoryId: categoryId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String languageId,
            required String name,
            required int categoryId,
          }) =>
              SubcategoriesCompanion.insert(
            id: id,
            languageId: languageId,
            name: name,
            categoryId: categoryId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubcategoriesTableProcessedTableManager = ProcessedTableManager<
    _$DuaDatabase,
    $SubcategoriesTable,
    Subcategory,
    $$SubcategoriesTableFilterComposer,
    $$SubcategoriesTableOrderingComposer,
    $$SubcategoriesTableAnnotationComposer,
    $$SubcategoriesTableCreateCompanionBuilder,
    $$SubcategoriesTableUpdateCompanionBuilder,
    (
      Subcategory,
      BaseReferences<_$DuaDatabase, $SubcategoriesTable, Subcategory>
    ),
    Subcategory,
    PrefetchHooks Function()>;

class $DuaDatabaseManager {
  final _$DuaDatabase _db;
  $DuaDatabaseManager(this._db);
  $$DuasTableTableManager get duas => $$DuasTableTableManager(_db, _db.duas);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$SubcategoriesTableTableManager get subcategories =>
      $$SubcategoriesTableTableManager(_db, _db.subcategories);
}
