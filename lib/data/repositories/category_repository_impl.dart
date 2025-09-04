import 'package:dua/data/datasource/local_data_source.dart';
import 'package:dua/data/mappers/category_mapper.dart';
import 'package:dua/domain/entities/category_entity.dart';
import 'package:dua/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final LocalDataSource localDataSource;

  // In-memory cache for faster repeat access
  static List<CategoryEntity>? _inMemoryCategories;
  static final Map<int, CategoryEntity> _categoryByIdCache = {};
  static final Map<String, List<CategoryEntity>> _categoriesByLanguageCache =
      {};

  CategoryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    try {
      // First check if we already have the data in memory
      if (_inMemoryCategories != null && _inMemoryCategories!.isNotEmpty) {
        return _inMemoryCategories!;
      }

      // If no cache, fetch from local database
      final categories = await localDataSource.getCategories();

      if (categories.isEmpty) {
        return [];
      }

      // Map and cache the results
      final entities = CategoryMapper.fromDbList(categories);
      _inMemoryCategories = entities;

      // Cache individual categories by ID
      for (final category in entities) {
        _categoryByIdCache[category.id] = category;
      }

      return entities;
    } catch (e) {
      // Try to return cached data even on error
      if (_inMemoryCategories != null) {
        return _inMemoryCategories!;
      }
      return [];
    }
  }

  @override
  Future<CategoryEntity?> getCategoryById(int id) async {
    try {
      // Check cache first
      if (_categoryByIdCache.containsKey(id)) {
        return _categoryByIdCache[id];
      }

      // If we have all categories in memory, but not this ID, then it doesn't exist
      if (_inMemoryCategories != null && _inMemoryCategories!.isNotEmpty) {
        return null;
      }

      // Otherwise, fetch from database
      final category = await localDataSource.getCategoryById(id);

      if (category == null) {
        return null;
      }

      // Map and cache the result
      final entity = CategoryMapper.fromDb(category);
      _categoryByIdCache[id] = entity;

      return entity;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CategoryEntity>> getCategoriesByLanguage(
      String languageId) async {
    try {
      // Check cache first
      if (_categoriesByLanguageCache.containsKey(languageId)) {
        return _categoriesByLanguageCache[languageId]!;
      }

      // If we have all categories in memory, filter by language
      if (_inMemoryCategories != null && _inMemoryCategories!.isNotEmpty) {
        final filteredCategories = _inMemoryCategories!
            .where((category) => category.languageId == languageId)
            .toList();

        // Cache the results
        _categoriesByLanguageCache[languageId] = filteredCategories;
        return filteredCategories;
      }

      // Otherwise, get all categories first and then filter
      final allCategories = await getAllCategories();
      final filteredCategories = allCategories
          .where((category) => category.languageId == languageId)
          .toList();

      // Cache the results
      _categoriesByLanguageCache[languageId] = filteredCategories;
      return filteredCategories;
    } catch (e) {
      return [];
    }
  }
}
