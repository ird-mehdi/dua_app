class AppConstant {
  static const String appName = 'Dua';
  static const String dbPath = 'assets/databases';
  static const String dbName = 'database.sqlite';
  static const String dbAssetPath = "$dbPath/$dbName";

  // Cache related constants
  static const String duaCacheKey = 'cached_duas';
  static const String bookmarkCacheKey = 'bookmarked_duas';

  // Cache durations
  static const Duration duaCacheDuration = Duration(days: 7);
  static const Duration bookmarkCacheDuration = Duration(days: 30);

  // Memory management
  static const int maxCachedDuas =
      1000; // Maximum number of duas to cache in memory
  static const Duration memoryCacheCleanupInterval =
      Duration(minutes: 30); // How often to check if memory cache needs cleanup
}
