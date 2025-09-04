import 'package:dua/domain/entities/prayer_time_entity.dart';

abstract class PrayerTimeRepository {
  List<PrayerTimeEntity> getPrayerTimes();
  Future<void> updatePrayerTime(int index, String newTime);
  Future<void> toggleNotification(int index);
}