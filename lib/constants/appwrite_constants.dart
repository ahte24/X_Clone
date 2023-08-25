class AppwriteConstants {
  static const String databaseId = '64d6579402e23b914416';
  static const String projectId = '64d3cfdfe078272c95b0';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String userCollectionId = '64d657d93effca82d7f8';
  static const String tweetCollectionId = '64e79710f0f61777de6e';

  static const String imagesBucketID = '64e8e4a0871ed51ae7fb';
  static String imageUrl(String imageID) =>
      '$endPoint/storage/buckets/$imagesBucketID/files/$imageID/view?project=$projectId&mode=admin';
}
