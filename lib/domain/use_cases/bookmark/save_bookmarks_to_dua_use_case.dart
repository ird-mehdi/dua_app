import 'package:dua/core/base/base_use_case.dart';
import 'package:dua/domain/entities/dua_bookmark_entity.dart';
import 'package:dua/domain/entities/dua_bookmark_folder_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveBookmarksToDuaUseCase extends BaseUseCase<String> {
  SaveBookmarksToDuaUseCase(
    super.errorMessageHandler,
    this._duaBookmarkRepository,
  );

  final DuaBookmarkRepository _duaBookmarkRepository;

  Future<Either<String, String>> execute({
    required int duaID,
    required List<DuaBookmarkFolderEntity> savingFolders,
  }) async {
    return mapResultToEither(() async {
      final List<DuaBookmarkEntity> generatedBookmarks =
          await _mapBookmarkFoldersIntoBookmarks(savingFolders, duaID);
      await _duaBookmarkRepository.saveBookmarksToDua(
        duaID: duaID,
        bookmarks: generatedBookmarks,
      );
      return savingFolders.isNotEmpty ? "Collection saved" : "";
    });
  }

  Future<List<DuaBookmarkEntity>> _mapBookmarkFoldersIntoBookmarks(
    List<DuaBookmarkFolderEntity> folders,
    int duaID,
  ) async {
    return folders
        .map(
          (folder) => DuaBookmarkEntity.placeholder(
            folderName: folder.name,
            color: folder.color,
            duaID: duaID,
          ),
        )
        .toList();
  }
}
