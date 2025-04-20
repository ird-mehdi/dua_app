import 'dart:async';

import 'package:dua/core/base/base_presenter.dart';
import 'package:dua/core/services/bookmark_sync_service.dart';
import 'package:dua/core/services/dua_cache_service.dart';
import 'package:dua/core/utility/isolate_utility.dart';
import 'package:dua/data/datasource/local_data_source.dart';
import 'package:dua/data/repositories/category_repository_impl.dart';
import 'package:dua/data/repositories/dua_bookmark_repository_impl.dart';
import 'package:dua/data/repositories/dua_repository_impl.dart';
import 'package:dua/data/repositories/subcategory_repository_impl.dart';
import 'package:dua/data/services/dua_database/database_service.dart';
import 'package:dua/data/services/error_message_handler_impl.dart';
import 'package:dua/domain/repositories/category_repository.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:dua/domain/repositories/dua_repository.dart';
import 'package:dua/domain/repositories/subcategory_repository.dart';
import 'package:dua/domain/service/error_message_handler.dart';
import 'package:dua/domain/use_cases/bookmark/create_bookmark_folder_use_case.dart';
import 'package:dua/domain/use_cases/bookmark/get_all_bookmark_folders_use_case.dart';
import 'package:dua/domain/use_cases/bookmark/save_bookmarks_to_dua_use_case.dart';
import 'package:dua/domain/use_cases/category/get_all_categories.dart';
import 'package:dua/domain/use_cases/category/get_categories_by_language.dart';
import 'package:dua/domain/use_cases/category/get_category_by_id.dart';
import 'package:dua/domain/use_cases/dua/get_all_dua.dart';
import 'package:dua/domain/use_cases/dua/get_duas_grouped_by_subcategory.dart';
import 'package:dua/domain/use_cases/dua/get_dua_light_by_id.dart';
import 'package:dua/domain/use_cases/dua/get_duas_light_by_category.dart';
import 'package:dua/domain/use_cases/dua/search_duas_light.dart';
import 'package:dua/domain/use_cases/subcategory/get_all_subcategories.dart';
import 'package:dua/domain/use_cases/subcategory/get_dua_names_by_subcategory_id.dart';
import 'package:dua/domain/use_cases/subcategory/get_subcategories_by_category.dart';
import 'package:dua/domain/use_cases/subcategory/get_subcategory_names_by_category_id.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_presenter.dart';
import 'package:dua/presentation/home/presenter/home_presenter.dart';
import 'package:dua/presentation/scheduale/presenter/schedule_presenter.dart';
import 'package:dua/presentation/settings/presenter/settings_presenter.dart';
import 'package:dua/presentation/subcategory/presenter/dua_subcategory_list_presenter.dart';
import 'package:dua/presentation/subcategory/presenter/sub_category_presenter.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt _serviceLocator = GetIt.instance;

T locate<T extends Object>() => _serviceLocator.get<T>();

void dislocate<T extends BasePresenter>() {
  unloadPresenterManually<T>();
  // Also close all isolates when a presenter is unloaded
  IsolateUtility.closeAllIsolatesWhenThreadCompletes();
}

class ServiceLocator {
  ServiceLocator._();
  static Future<void> setUp({bool startOnlyService = false}) async {
    final ServiceLocator locator = ServiceLocator._();
    await locator._setUpServices();
    if (startOnlyService) return;
    await locator._setUpDataSources();
    await locator._setUpRepositories();
    await locator._setUpUseCase();
    await locator._setUpPresenters();
  }

  Future<void> _setUpRepositories() async {
    // _serviceLocator.registerLazySingleton<SurahRepository>(
    //   () => SurahRepositoryImpl(locate()),
    // );
    _serviceLocator.registerLazySingleton<DuaRepository>(
        () => DuaRepositoryImpl(localDataSource: locate()));

    // Register bookmark repository
    _serviceLocator.registerLazySingleton<DuaBookmarkRepository>(
        () => DuaBookmarkRepositoryImpl());

    // Register category and subcategory repositories
    _serviceLocator.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(localDataSource: locate()));

    _serviceLocator.registerLazySingleton<SubcategoryRepository>(
        () => SubcategoryRepositoryImpl(localDataSource: locate()));
  }

  Future<void> _setUpServices() async {
    _serviceLocator.registerLazySingleton<ErrorMessageHandler>(
        ErrorMessageHandlerImpl.new);
    _serviceLocator.registerLazySingleton<DuaDatabase>(DuaDatabase.new);

    // Register SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    _serviceLocator.registerLazySingleton(() => sharedPreferences);

    // Register DuaCacheService
    _serviceLocator.registerLazySingleton<DuaCacheService>(
        () => DuaCacheService(locate()));

    // Register BookmarkSyncService
    _serviceLocator.registerLazySingleton<BookmarkSyncService>(
        () => BookmarkSyncService(locate()));
  }

  Future<void> _setUpDataSources() async {
    // _serviceLocator
    //   .registerLazySingleton(() => SurahLocalDataSource(locate()))
    _serviceLocator.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(databaseService: locate()));
  }

  Future<void> _setUpPresenters() async {
    _serviceLocator.registerLazySingleton(() => loadPresenter(HomePresenter(
          getAllCategoriesUseCase: locate(),
          getCategoriesByLanguageUseCase: locate(),
          getAllSubcategoriesUseCase: locate(),
          getSubcategoriesByCategoryUseCase: locate(),
          getSubcategoryNamesByCategoryIdUseCase: locate(),
        )));
    _serviceLocator
        .registerLazySingleton(() => loadPresenter(SubCategoryPresenter(
              getSubcategoryNamesByCategoryIdUseCase: locate(),
              getDuaNamesBySubcategoryIdUseCase: locate(),
              getDuasGroupedBySubcategoryUseCase: locate(),
            )));
    _serviceLocator
        .registerLazySingleton(() => loadPresenter(SchedulePresenter()));
    _serviceLocator.registerLazySingleton(
        () => loadPresenter(AllDuasPresenter(locate(), locate())));
    _serviceLocator
        .registerLazySingleton(() => loadPresenter(BookmarkPresenter()));
    _serviceLocator
        .registerLazySingleton(() => loadPresenter(SettingsPresenter()));

    // Register DuaSubcategoryListPresenter
    _serviceLocator
        .registerLazySingleton(() => loadPresenter(DuaSubcategoryListPresenter(
              getDuasGroupedBySubcategoryUseCase: locate(),
            )));
  }

  Future<void> _setUpUseCase() async {
    // _serviceLocator
    //     .registerFactory(() => GetSettingsStateUseCase(locate(), locate()));
    _serviceLocator
        .registerLazySingleton(() => GetAllDuaUseCase(duaRepository: locate()));

    // Register dua grouping use case
    _serviceLocator.registerLazySingleton(
        () => GetDuasGroupedBySubcategoryUseCase(duaRepository: locate()));

    // Register dua search use case
    _serviceLocator.registerLazySingleton(
        () => SearchDuasLightUseCase(duaRepository: locate()));

    // Register get single dua light use case
    _serviceLocator.registerLazySingleton(
        () => GetDuaLightByIdUseCase(duaRepository: locate()));

    // Register get duas by category light use case
    _serviceLocator.registerLazySingleton(
        () => GetDuasLightByCategoryUseCase(duaRepository: locate()));

    // Register bookmark use cases
    _serviceLocator.registerLazySingleton(
        () => SaveBookmarksToDuaUseCase(locate(), locate()));
    _serviceLocator.registerLazySingleton(
        () => CreateBookmarkFolderUseCase(locate(), locate()));
    _serviceLocator.registerLazySingleton(
        () => GetAllBookmarkFoldersUseCase(locate(), locate()));

    // Register category and subcategory use cases
    _serviceLocator.registerLazySingleton(
        () => GetAllCategoriesUseCase(categoryRepository: locate()));
    _serviceLocator.registerLazySingleton(
        () => GetCategoryByIdUseCase(categoryRepository: locate()));
    _serviceLocator.registerLazySingleton(
        () => GetCategoriesByLanguageUseCase(categoryRepository: locate()));
    _serviceLocator.registerLazySingleton(
        () => GetAllSubcategoriesUseCase(subcategoryRepository: locate()));
    _serviceLocator.registerLazySingleton(() =>
        GetSubcategoriesByCategoryUseCase(subcategoryRepository: locate()));
    _serviceLocator.registerLazySingleton(() =>
        GetSubcategoryNamesByCategoryIdUseCase(
            subcategoryRepository: locate()));
    _serviceLocator.registerLazySingleton(() =>
        GetDuaNamesBySubcategoryIdUseCase(subcategoryRepository: locate()));
  }
}
