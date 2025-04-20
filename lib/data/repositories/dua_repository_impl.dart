import 'package:dua/data/datasource/local_data_source.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/domain/repositories/dua_repository.dart';

class DuaRepositoryImpl extends DuaRepository {
  final LocalDataSource localDataSource;

  // In-memory cache for faster repeat access
  static Map<int, List<DuaEntity>>? _duasBySubcategoryCache;
  // Cache for lightweight dua data
  static final Map<int, Map<String, dynamic>> _lightDuaCache = {};
  static final Map<int, List<Map<String, dynamic>>> _lightDuasByCategoryCache =
      {};
  // Cache for search results
  static final Map<String, List<Map<String, dynamic>>> _searchResultsCache = {};

  DuaRepositoryImpl({required this.localDataSource});

  @override
  Future<Map<int, List<DuaEntity>>> getDuasGroupedBySubcategory() async {
    try {
      // Check if we already have the data in memory cache
      if (_duasBySubcategoryCache != null) {
        return _duasBySubcategoryCache!;
      }

      // Get categories to work with
      final categories = await localDataSource.getCategories();

      // Create a map to store the result
      final Map<int, List<DuaEntity>> groupedDuas = {};

      // Fetch lightweight duas for each category
      for (final category in categories) {
        final categoryId = category.id;

        // Get lightweight duas for this category
        final lightDuas = await getDuasLightByCategory(categoryId);

        // Get subcategories for this category
        final subcategories =
            await localDataSource.getSubcategoriesByCategory(categoryId);

        // Group by subcategory
        for (final subcategory in subcategories) {
          final subcategoryId = subcategory.id;

          if (!groupedDuas.containsKey(subcategoryId)) {
            groupedDuas[subcategoryId] = [];
          }

          // Find duas that match this subcategory
          for (final dua in lightDuas) {
            // Convert lightweight dua to DuaEntity
            groupedDuas[subcategoryId]!.add(DuaEntity(
              id: dua['id'] as int,
              languageId: '',
              groups: '[]',
              name: dua['title'] as String? ?? '',
              context: '',
              source: '',
              indopak: '',
              clean: dua['arabic_text'] as String? ?? '',
              transliteration: '',
              translation: '',
              note: '',
              reference: '',
              audio: 0,
              categoryId: categoryId,
              subcategoryId: subcategoryId,
            ));
          }
        }
      }

      // Cache the result for faster future access
      _duasBySubcategoryCache = groupedDuas;

      return groupedDuas;
    } catch (e) {
      // Return empty map on error
      return {};
    }
  }

  @override
  Future<Map<String, dynamic>?> getDuaLightById(int id,
      {bool forceRefresh = false}) async {
    try {
      // Check in-memory cache first if not forcing refresh
      if (!forceRefresh && _lightDuaCache.containsKey(id)) {
        return _lightDuaCache[id];
      }

      // Fetch from local data source
      final dua =
          await localDataSource.getDuaLightById(id, forceRefresh: forceRefresh);

      if (dua != null) {
        // Store in cache
        _lightDuaCache[id] = dua;
      }

      return dua;
    } catch (e) {
      // Try to return cached data even on error
      if (_lightDuaCache.containsKey(id)) {
        return _lightDuaCache[id];
      }
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getDuasLightByCategory(int categoryId,
      {bool forceRefresh = false}) async {
    try {
      // Check in-memory cache first if not forcing refresh
      if (!forceRefresh && _lightDuasByCategoryCache.containsKey(categoryId)) {
        return _lightDuasByCategoryCache[categoryId]!;
      }

      // Fetch from local data source
      final duas = await localDataSource.getDuasLightByCategory(categoryId,
          forceRefresh: forceRefresh);

      if (duas.isNotEmpty) {
        // Store in cache
        _lightDuasByCategoryCache[categoryId] = duas;
      }

      return duas;
    } catch (e) {
      // Try to return cached data even on error
      if (_lightDuasByCategoryCache.containsKey(categoryId)) {
        return _lightDuasByCategoryCache[categoryId]!;
      }
      return [];
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchDuasLight(String query,
      {bool forceRefresh = false}) async {
    try {
      // Create a cache key for this search
      final String cacheKey = 'search_$query';

      // Check in-memory cache first if not forcing refresh
      if (!forceRefresh && _searchResultsCache.containsKey(cacheKey)) {
        return _searchResultsCache[cacheKey]!;
      }

      // Fetch from local data source
      final duas = await localDataSource.searchDuasLight(query,
          forceRefresh: forceRefresh);

      if (duas.isNotEmpty) {
        // Store in cache
        _searchResultsCache[cacheKey] = duas;
      }

      return duas;
    } catch (e) {
      // Try to return cached data even on error
      final String cacheKey = 'search_$query';
      if (_searchResultsCache.containsKey(cacheKey)) {
        return _searchResultsCache[cacheKey]!;
      }
      return [];
    }
  }
}
