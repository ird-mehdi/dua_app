import 'package:dua/core/base/base_use_case.dart';
import 'package:dua/domain/entities/dua_bookmark_folder_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBookmarkFoldersUseCase
    extends BaseUseCase<List<DuaBookmarkFolderEntity>> {
  GetAllBookmarkFoldersUseCase(
    this._duaBookmarkRepository,
    super._errorMessageHandler,
  );

  final DuaBookmarkRepository _duaBookmarkRepository;

  Future<Either<String, List<DuaBookmarkFolderEntity>>> execute() async {
    final Either<String, List<DuaBookmarkFolderEntity>> result =
        await mapResultToEither(
      () async => _duaBookmarkRepository.getAllBookmarkFolders(),
    );
    return result;
  }
}
