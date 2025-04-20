import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/services/dua_cache_service.dart';
import 'package:dua/data/datasource/local_data_source.dart';
import 'package:dua/data/mappers/dua_mapper.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_repository.dart';

class DuaRepositoryImpl extends DuaRepository {
  final LocalDataSource localDataSource;
  late final DuaCacheService _cacheService;

  // In-memory cache for faster repeat access
  static List<DuaEntity>? _inMemoryDuas;
  static Map<int, List<DuaEntity>>? _duasBySubcategoryCache;

  DuaRepositoryImpl({required this.localDataSource}) {
    _cacheService = locate<DuaCacheService>();
  }

  @override
  Future<List<DuaEntity>> getAllDua() async {
    try {
      // First check if we already have the data in memory
      if (_inMemoryDuas != null && _inMemoryDuas!.isNotEmpty) {
        return _inMemoryDuas!;
      }

      // Next, check the cache service which handles both memory and disk caching
      final cachedDuas = await _cacheService.getCachedDuas();
      if (cachedDuas != null && cachedDuas.isNotEmpty) {
        _inMemoryDuas = cachedDuas;
        return cachedDuas;
      }

      // If no cache, fetch from local database
      final duas = await localDataSource.getDuas();

      if (duas.isEmpty) {
        return [];
      }

      // Map and cache the results
      final entities = DuaMapper.fromDtoList(duas);
      _inMemoryDuas = entities;

      // Store in cache service for future use
      await _cacheService.cacheDuas(entities);

      return entities;
    } catch (e) {
      // Try to return cached data even on error
      if (_inMemoryDuas != null) {
        return _inMemoryDuas!;
      }
      return [];
    }
  }

  @override
  Future<Map<int, List<DuaEntity>>> getDuasGroupedBySubcategory() async {
    try {
      // Check if we already have the data in memory cache
      if (_duasBySubcategoryCache != null) {
        return _duasBySubcategoryCache!;
      }

      // First get all duas
      final allDuas = await getAllDua();

      // Group duas by subcategory ID
      final Map<int, List<DuaEntity>> groupedDuas = {};

      for (final dua in allDuas) {
        final subcategoryId = dua.subcategoryId;

        if (!groupedDuas.containsKey(subcategoryId)) {
          groupedDuas[subcategoryId] = [];
        }

        groupedDuas[subcategoryId]!.add(dua);
      }

      // Cache the result for faster future access
      _duasBySubcategoryCache = groupedDuas;

      return groupedDuas;
    } catch (e) {
      // Return empty map on error
      return {};
    }
  }
}
