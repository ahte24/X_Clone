import 'package:flutter/foundation.dart';
import 'package:x_clone/core/enums/tweet_type_enum.dart';

@immutable
class Tweet {
  final String text;
  final String link;
  final List<String> imageLinks;
  final List<String> hashtags;
  final String uid;
  final TweetType tweetType;
  final DateTime createdAt;
  final List<String> likes;
  final List<String> commentIds;
  final String id;
  final int reshareCount;
  const Tweet({
    required this.text,
    required this.link,
    required this.imageLinks,
    required this.hashtags,
    required this.uid,
    required this.tweetType,
    required this.createdAt,
    required this.likes,
    required this.commentIds,
    required this.id,
    required this.reshareCount,
  });

  Tweet copyWith({
    String? text,
    String? link,
    List<String>? imageLinks,
    List<String>? hashtags,
    String? uid,
    TweetType? tweetType,
    DateTime? createdAt,
    List<String>? likes,
    List<String>? commentIds,
    String? id,
    int? reshareCount,
  }) {
    return Tweet(
      text: text ?? this.text,
      link: link ?? this.link,
      imageLinks: imageLinks ?? this.imageLinks,
      hashtags: hashtags ?? this.hashtags,
      uid: uid ?? this.uid,
      tweetType: tweetType ?? this.tweetType,
      createdAt: createdAt ?? this.createdAt,
      likes: likes ?? this.likes,
      commentIds: commentIds ?? this.commentIds,
      id: id ?? this.id,
      reshareCount: reshareCount ?? this.reshareCount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}; 
    result.addAll({'text': text});
    result.addAll({'link': link});
    result.addAll({'imageLinks': imageLinks});
    result.addAll({'hashtags': hashtags});
    result.addAll({'uid': uid});
    result.addAll({'tweetType': tweetType.type});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    result.addAll({'likes': likes});
    result.addAll({'commentIds': commentIds});
    result.addAll({'reshareCount': reshareCount});

    return result;
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      text: map['text'] ?? '',
      link: map['link'] ?? '',
      imageLinks: List<String>.from(map['imageLinks']),
      hashtags: List<String>.from(map['hashtags']),
      uid: map['uid'] ?? '',
      tweetType: (map['tweetType'] as String).toTweetTypeEnum(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      likes: List<String>.from(map['likes']),
      commentIds: List<String>.from(map['commentIds']),
      id: map['\$id'] ?? '',
      reshareCount: map['reshareCount']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'Tweet(text: $text, link: $link, imageLinks: $imageLinks, hashtags: $hashtags, uid: $uid, tweetType: $tweetType, createdAt: $createdAt, likes: $likes, commentIds: $commentIds, id: $id, reshareCount: $reshareCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tweet &&
        other.text == text &&
        other.link == link &&
        listEquals(other.imageLinks, imageLinks) &&
        listEquals(other.hashtags, hashtags) &&
        other.uid == uid &&
        other.tweetType == tweetType &&
        other.createdAt == createdAt &&
        listEquals(other.likes, likes) &&
        listEquals(other.commentIds, commentIds) &&
        other.id == id &&
        other.reshareCount == reshareCount;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        link.hashCode ^
        imageLinks.hashCode ^
        hashtags.hashCode ^
        uid.hashCode ^
        tweetType.hashCode ^
        createdAt.hashCode ^
        likes.hashCode ^
        commentIds.hashCode ^
        id.hashCode ^
        reshareCount.hashCode;
  }
}
