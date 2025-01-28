import 'package:dua/data/models/prayer_time_model.dart';
import 'package:dua/domain/entities/prayer_time_entity.dart';
import 'package:dua/domain/repositories/prayer_time_repository.dart';
import 'package:flutter/material.dart';

class PrayerTimeRepositoryImpl implements PrayerTimeRepository {
  final List<PrayerTimeModel> _prayerTimes = [
    PrayerTimeModel(name: 'Fazar', time: '4:50 AM', icon: Icons.sunny),
    PrayerTimeModel(name: 'Sunrise', time: '4:50 AM', icon: Icons.sunny),
    // ... other prayer times
  ];

  @override
  List<PrayerTimeEntity> getPrayerTimes() => _prayerTimes;

  @override
  Future<void> updatePrayerTime(int index, String newTime) async {
    _prayerTimes[index] = _prayerTimes[index].copyWith(time: newTime);
  }

  @override
  Future<void> toggleNotification(int index) async {
    _prayerTimes[index] = _prayerTimes[index].copyWith(
      isNotificationEnabled: !_prayerTimes[index].isNotificationEnabled,
    );
  }
  
}