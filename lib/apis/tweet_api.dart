import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:x_clone/constants/appwrite_constants.dart';
import 'package:x_clone/core/core.dart';
import 'package:x_clone/core/providers.dart';
import 'package:x_clone/models/tweet_model.dart';

final tweerAPIProvider = Provider((ref) {
  return TweetAPI(
    db: ref.watch(appwriteDatabaseProvider),
  );
});

abstract class ITweetAPI {
  FutureEither<Document> shareTweet(Tweet tweet);
  Future<List<Document>> getTweets();
}

class TweetAPI implements ITweetAPI {
  final Databases _db;
  TweetAPI({required Databases db}) : _db = db;

  @override
  FutureEither<Document> shareTweet(Tweet tweet) async {
    try {
      final document = await _db.createDocument(
        collectionId: AppwriteConstants.tweetCollectionId,
        databaseId: AppwriteConstants.databaseId,
        documentId: ID.unique(),
        data: tweet.toMap(),
        permissions: List.empty(),
      );
      return right(document);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occured',
          stackTrace,
        ),
      );
    } catch (e, stackTrace) {
      return left(Failure(
        e.toString(),
        stackTrace,
      ));
    }
  }

  @override
  Future<List<Document>> getTweets() async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.tweetCollectionId,
    );
    return document.documents;
  }
}
