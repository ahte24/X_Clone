enum TweetType {
  image('image'),
  text('text');

  final String type;

  const TweetType(this.type);
}

extension ConvertTweet on String {
  TweetType toTweetTypeEnum() {
    switch (this) {
      case 'text':
        return TweetType.text;
      case 'image':
        return TweetType.image;
      default:
        return TweetType.text;
    }
  }
}
