import 'package:dua/core/base/base_use_case.dart';
import 'package:dua/domain/entities/dua_bookmark_entity.dart';
import 'package:dua/domain/repositories/dua_bookmark_repository.dart';
import 'package:dua/domain/service/error_message_handler.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class CreateBookmarkFolderUseCase extends BaseUseCase<String> {
  CreateBookmarkFolderUseCase(
    this._duaBookmarkRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  final DuaBookmarkRepository _duaBookmarkRepository;

  Future<Either<String, String>> execute({
    required String name,
    required Color color,
    required int duaID,
  }) async {
    return mapResultToEither(() async {
      await _saveAPlaceholderBookmark(
        name: name,
        color: color,
        duaID: duaID,
      );
      return "Folder created";
    });
  }

  Future<void> _saveAPlaceholderBookmark({
    required String name,
    required Color color,
    required int duaID,
  }) async {
    await _duaBookmarkRepository.createBookmarkFolder(
      name: name,
      colorValue: color.value,
    );

    final bookmark = DuaBookmarkEntity.placeholder(
      folderName: name,
      color: color,
      duaID: duaID,
    );

    await _duaBookmarkRepository.saveBookmarksToDua(
      duaID: duaID,
      bookmarks: [bookmark],
    );
  }
}
