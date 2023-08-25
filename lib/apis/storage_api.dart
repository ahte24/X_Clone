import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:x_clone/constants/appwrite_constants.dart';
import 'package:x_clone/core/providers.dart';

final storageAPIProvider = Provider((ref) {
  return StorageAPI(
    storage: ref.watch(appwriteStorageProvider),
  );
});

class StorageAPI {
  final Storage _storage;
  StorageAPI({required Storage storage}) : _storage = storage;

  Future<List<String>> uploadImage(List<File> files) async {
    List<String> imageLink = [];
    for (final file in files) {
      final uploadedImage = await _storage.createFile(
        bucketId: AppwriteConstants.imagesBucketID,
        file: InputFile.fromPath(path: file.path),
        fileId: ID.unique(),
      );
      imageLink.add(AppwriteConstants.imageUrl(uploadedImage.$id));
    }
    return imageLink;
  }
}
