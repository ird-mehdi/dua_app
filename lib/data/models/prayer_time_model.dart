import 'package:dua/domain/entities/prayer_time_entity.dart';
import 'package:flutter/material.dart';

class PrayerTimeModel extends PrayerTimeEntity {
  PrayerTimeModel({
    required super.name,
    required super.time,
    required super.icon,
    super.isNotificationEnabled,
  });

  factory PrayerTimeModel.fromEntity(PrayerTimeEntity entity) {
    return PrayerTimeModel(
      name: entity.name,
      time: entity.time,
      icon: entity.icon,
      isNotificationEnabled: entity.isNotificationEnabled,
    );
  }

  PrayerTimeModel copyWith({
    String? name,
    String? time,
    IconData? icon,
    bool? isNotificationEnabled,
  }) {
    return PrayerTimeModel(
      name: name ?? this.name,
      time: time ?? this.time,
      icon: icon ?? this.icon,
      isNotificationEnabled: isNotificationEnabled ?? this.isNotificationEnabled,
    );
  }
}