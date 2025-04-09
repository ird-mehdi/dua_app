import 'dart:convert';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuaCacheService {
  static const String _cacheKey = 'cached_duas';
  static const Duration _cacheDuration = Duration(hours: 24);
  final SharedPreferences _prefs;

  DuaCacheService(this._prefs);

  Future<void> cacheDuas(List<DuaEntity> duas) async {
    final cacheData = {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'duas': duas.map((dua) => dua.toJson()).toList(),
    };
    await _prefs.setString(_cacheKey, jsonEncode(cacheData));
  }

  Future<List<DuaEntity>?> getCachedDuas() async {
    final cachedString = _prefs.getString(_cacheKey);
    if (cachedString == null) return null;

    final cachedData = jsonDecode(cachedString) as Map<String, dynamic>;
    final timestamp = cachedData['timestamp'] as int;
    final now = DateTime.now().millisecondsSinceEpoch;

    if (now - timestamp > _cacheDuration.inMilliseconds) {
      await _prefs.remove(_cacheKey);
      return null;
    }

    final duasJson = cachedData['duas'] as List;
    return duasJson.map((json) => DuaEntity.fromJson(json)).toList();
  }

  Future<void> clearCache() async {
    await _prefs.remove(_cacheKey);
  }
} 