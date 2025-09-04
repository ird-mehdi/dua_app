import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DuaBookmarkEntity extends Equatable {
  const DuaBookmarkEntity({
    this.id = -1,
    required this.folderName,
    required this.color,
    required this.duaID,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DuaBookmarkEntity.placeholder({
    required String folderName,
    required Color color,
    required int duaID,
  }) {
    return DuaBookmarkEntity(
      folderName: folderName,
      color: color,
      duaID: duaID,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  final int id;
  final String folderName;
  final int duaID;
  final Color color;
  final DateTime createdAt;
  final DateTime updatedAt;

  DuaBookmarkEntity copyWith({
    int? id,
    String? folderName,
    int? duaID,
    Color? color,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DuaBookmarkEntity(
      id: id ?? this.id,
      folderName: folderName ?? this.folderName,
      duaID: duaID ?? this.duaID,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'folderName': folderName,
      'duaID': duaID,
      'color': color.value,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory DuaBookmarkEntity.fromMap(Map<String, dynamic> map) {
    return DuaBookmarkEntity(
      id: map['id'] as int,
      folderName: map['folderName'] as String,
      duaID: map['duaID'] as int,
      color: Color(map['color'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  @override
  List<Object?> get props =>
      [id, folderName, duaID, color, createdAt, updatedAt];
}
