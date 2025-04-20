import 'package:dua/data/datasource/local_data_source.dart';
import 'package:dua/data/mappers/dua_mapper.dart';
import 'package:dua/data/mappers/subcategory_mapper.dart';
import 'package:dua/domain/entities/subcategory_entity.dart';
import 'package:dua/domain/repositories/subcategory_repository.dart';

class SubcategoryRepositoryImpl extends SubcategoryRepository {
  final LocalDataSource localDataSource;

  // In-memory cache for faster repeat access
  static List<SubcategoryEntity>? _inMemorySubcategories;
  static final Map<int, List<SubcategoryEntity>> _subcategoriesByCategoryCache =
      {};
  // Map to store subcategory names by category_id
  static final Map<int, List<String>> _subcategoryNamesByCategoryId = {};
  static final Map<int, List<String>> _duaNamesBySubcategoryId = {};

  SubcategoryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<SubcategoryEntity>> getAllSubcategories() async {
    try {
      // First check if we already have the data in memory
      if (_inMemorySubcategories != null &&
          _inMemorySubcategories!.isNotEmpty) {
        return _inMemorySubcategories!;
      }

      // If no cache, fetch from local database
      final subcategories = await localDataSource.getSubcategories();

      if (subcategories.isEmpty) {
        return [];
      }

      // Map and cache the results
      final entities = SubcategoryMapper.fromDbList(subcategories);
      _inMemorySubcategories = entities;

      return entities;
    } catch (e) {
      // Try to return cached data even on error
      if (_inMemorySubcategories != null) {
        return _inMemorySubcategories!;
      }
      return [];
    }
  }

  @override
  Future<List<SubcategoryEntity>> getSubcategoriesByCategory(
      int categoryId) async {
    try {
      // Check cache first
      if (_subcategoriesByCategoryCache.containsKey(categoryId)) {
        return _subcategoriesByCategoryCache[categoryId]!;
      }

      // If we have all subcategories in memory, filter by category ID
      if (_inMemorySubcategories != null &&
          _inMemorySubcategories!.isNotEmpty) {
        final filteredSubcategories = _inMemorySubcategories!
            .where((subcategory) => subcategory.categoryId == categoryId)
            .toList();

        _subcategoriesByCategoryCache[categoryId] = filteredSubcategories;
        return filteredSubcategories;
      }

      // Otherwise, fetch from database
      final subcategories =
          await localDataSource.getSubcategoriesByCategory(categoryId);

      if (subcategories.isEmpty) {
        return [];
      }

      // Map and cache the results
      final entities = SubcategoryMapper.fromDbList(subcategories);
      _subcategoriesByCategoryCache[categoryId] = entities;

      return entities;
    } catch (e) {
      return [];
    }
  }

  /// Creates a map of subcategory names grouped by category_id
  /// Returns a Map where the key is the category_id and the value is a list of subcategory names
  @override
  Future<Map<int, List<String>>> getSubcategoryNamesByCategoryId() async {
    try {
      // If the map is already populated, return it
      if (_subcategoryNamesByCategoryId.isNotEmpty) {
        return _subcategoryNamesByCategoryId;
      }

      // Get all subcategories if not already in memory
      final allSubcategories = await getAllSubcategories();

      // Group subcategories by category_id
      final Map<int, List<String>> result = {};

      for (var subcategory in allSubcategories) {
        if (!result.containsKey(subcategory.categoryId)) {
          result[subcategory.categoryId] = [];
        }
        result[subcategory.categoryId]!.add(subcategory.name);
      }

      // Cache the result
      _subcategoryNamesByCategoryId.addAll(result);

      return result;
    } catch (e) {
      return {};
    }
  }

  /// Creates a map of subcategory names grouped by category_id
  /// Returns a Map where the key is the category_id and the value is a list of subcategory names
  @override
  Future<Map<int, List<String>>> getDuaNamesBySubcategoryId() async {
    try {
      // If the map is already populated, return it
      if (_duaNamesBySubcategoryId.isNotEmpty) {
        return _duaNamesBySubcategoryId;
      }

      final duas = await localDataSource.getDuas();

      // Get all subcategories if not already in memory
      final allSubcategories = DuaMapper.fromDtoList(duas);

      // Group subcategories by category_id
      final Map<int, List<String>> result = {};

      for (var subcategory in allSubcategories) {
        print(subcategory);
        print(subcategory.subcategoryId);

        if (!result.containsKey(subcategory.subcategoryId)) {
          result[subcategory.categoryId] = [];
        }
        result[subcategory.categoryId]!.add(subcategory.name);
      }

      // Cache the result
      _duaNamesBySubcategoryId.addAll(result);

      return result;
    } catch (e) {
      return {};
    }
  }

  /// Gets a list of subcategory names for a specific category_id
  /// Returns an empty list if no subcategories found for the given category_id
  @override
  Future<List<String>> getSubcategoryNamesByCategory(int categoryId) async {
    try {
      // Check if we have the map in memory
      if (_subcategoryNamesByCategoryId.isEmpty) {
        await getSubcategoryNamesByCategoryId();
      }

      // Return subcategory names for the requested category_id
      return _subcategoryNamesByCategoryId[categoryId] ?? [];
    } catch (e) {
      return [];
    }
  }
}
