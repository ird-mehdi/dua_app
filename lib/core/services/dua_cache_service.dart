import 'dart:convert';
import 'package:dua/core/constants/app_constant.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuaCacheService {
  static const String _cacheKey = AppConstant.duaCacheKey;
  static const Duration _cacheDuration = AppConstant.duaCacheDuration;
  final SharedPreferences _prefs;

  // Static memory cache (persists as long as app is in memory)
  static List<DuaEntity>? _memoryCache;
  static int? _memoryCacheTimestamp;

  // Last cleanup timestamp to prevent too frequent memory checks
  static int? _lastCleanupTimestamp;

  DuaCacheService(this._prefs);

  Future<void> cacheDuas(List<DuaEntity> duas) async {
    // Update memory cache first
    _memoryCache = duas;
    _memoryCacheTimestamp = DateTime.now().millisecondsSinceEpoch;

    // Then persist to SharedPreferences
    final cacheData = {
      'timestamp': _memoryCacheTimestamp,
      'duas': duas.map((dua) => dua.toJson()).toList(),
    };
    await _prefs.setString(_cacheKey, jsonEncode(cacheData));
  }

  Future<List<DuaEntity>?> getCachedDuas() async {
    final now = DateTime.now().millisecondsSinceEpoch;

    // Check if we need to clean up memory (do this occasionally)
    _checkMemoryCleanup(now);

    // Check memory cache first
    if (_memoryCache != null && _memoryCacheTimestamp != null) {
      // Check if memory cache is still valid
      if (now - _memoryCacheTimestamp! <= _cacheDuration.inMilliseconds) {
        return _memoryCache;
      }
    }

    // If memory cache is not available or expired, check persistent cache
    final cachedString = _prefs.getString(_cacheKey);
    if (cachedString == null) return null;

    final cachedData = jsonDecode(cachedString) as Map<String, dynamic>;
    final timestamp = cachedData['timestamp'] as int;

    if (now - timestamp > _cacheDuration.inMilliseconds) {
      // Clear cache if expired
      await _prefs.remove(_cacheKey);
      _memoryCache = null;
      _memoryCacheTimestamp = null;
      return null;
    }

    // Load from persistent cache and update memory cache
    final duasJson = cachedData['duas'] as List;
    _memoryCache = duasJson.map((json) => DuaEntity.fromJson(json)).toList();
    _memoryCacheTimestamp = timestamp;

    return _memoryCache;
  }

  Future<void> clearCache() async {
    _memoryCache = null;
    _memoryCacheTimestamp = null;
    await _prefs.remove(_cacheKey);
  }

  // Check if we have a valid memory cache
  bool hasValidMemoryCache() {
    if (_memoryCache == null || _memoryCacheTimestamp == null) {
      return false;
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    return now - _memoryCacheTimestamp! <= _cacheDuration.inMilliseconds;
  }

  // Perform memory cleanup check - only run periodically to avoid overhead
  void _checkMemoryCleanup(int now) {
    // Only check for cleanup if it's been a while since last check
    if (_lastCleanupTimestamp == null ||
        now - _lastCleanupTimestamp! >
            AppConstant.memoryCacheCleanupInterval.inMilliseconds) {
      _lastCleanupTimestamp = now;

      // If we have too many items in memory, clear it to prevent memory issues
      if (_memoryCache != null &&
          _memoryCache!.length > AppConstant.maxCachedDuas) {
        print('Memory cache exceeds maximum size, clearing...');
        _memoryCache = null;
        _memoryCacheTimestamp = null;
      }
    }
  }
}
