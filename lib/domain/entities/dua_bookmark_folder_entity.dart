import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DuaBookmarkFolderEntity extends Equatable {
  const DuaBookmarkFolderEntity({
    required this.id,
    required this.name,
    required this.color,
    required this.count,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DuaBookmarkFolderEntity.favourites() {
    return DuaBookmarkFolderEntity(
      id: 28938,
      name: "Favourites",
      color: const Color(0xff17B686),
      count: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  final int id;
  final String name;
  final Color color;
  final int count;
  final DateTime createdAt;
  final DateTime updatedAt;

  DuaBookmarkFolderEntity copyWith({
    int? id,
    String? name,
    Color? color,
    int? count,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DuaBookmarkFolderEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      count: count ?? this.count,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color.value,
      'count': count,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory DuaBookmarkFolderEntity.fromMap(Map<String, dynamic> map) {
    return DuaBookmarkFolderEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      color: Color(map['color'] as int),
      count: map['count'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  @override
  List<Object?> get props => [id, name, color, count, createdAt, updatedAt];
}
