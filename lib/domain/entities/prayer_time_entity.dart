import 'package:flutter/material.dart';

class PrayerTimeEntity {
  final String name;
  final String time;
  final IconData icon;
  final bool isNotificationEnabled;

  const PrayerTimeEntity({
    required this.name,
    required this.time,
    required this.icon,
    this.isNotificationEnabled = true,
  });
}