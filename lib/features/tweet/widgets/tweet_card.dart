import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/common/common.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/core/enums/tweet_type_enum.dart';
import 'package:x_clone/features/auth/controller/auth_controller.dart';
import 'package:x_clone/features/tweet/widgets/crousel_image.dart';
import 'package:x_clone/features/tweet/widgets/hashtags_text.dart';
import 'package:x_clone/features/tweet/widgets/tweet_icon_button.dart';
import 'package:x_clone/models/tweet_model.dart';
import 'package:x_clone/theme/pallete.dart';
import 'package:timeago/timeago.dart' as timeago;

class TweetCard extends ConsumerWidget {
  final Tweet tweet;
  const TweetCard({super.key, required this.tweet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDetailsProvider(tweet.uid)).when(
          data: (user) {
            return Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePic),
                        radius: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //retweeted
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    user.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                Text(
                                  '@${user.name} · ${timeago.format(
                                    tweet.createdAt,
                                    locale: 'en_short',
                                  )}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Pallete.greyColor,
                                  ),
                                ),
                              ],
                            ),
                            // Replied to
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: HashtagText(
                                
                                text: tweet.text,
                              ),
                            ),
                            if (tweet.tweetType == TweetType.image)
                              CarouselImage(imageLinks: tweet.imageLinks),
                            if (tweet.link.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              AnyLinkPreview(
                                displayDirection:
                                    UIDirection.uiDirectionHorizontal,
                                link: 'https://${tweet.link}',
                              )
                            ],
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                right: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TweetIconButton(
                                    pathName: AssetsConstants.viewsIcon,
                                    onTap: () {},
                                    text: (tweet.commentIds.length +
                                            tweet.reshareCount +
                                            tweet.likes.length)
                                        .toString(),
                                  ),
                                  TweetIconButton(
                                    pathName: AssetsConstants.commentIcon,
                                    onTap: () {},
                                    text: (tweet.commentIds.length).toString(),
                                  ),
                                  TweetIconButton(
                                    pathName: AssetsConstants.retweetIcon,
                                    onTap: () {},
                                    text: (tweet.reshareCount).toString(),
                                  ),
                                  TweetIconButton(
                                    pathName: AssetsConstants.likeOutlinedIcon,
                                    onTap: () {},
                                    text: (tweet.likes.length).toString(),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share_outlined,
                                      size: 23,
                                      color: Pallete.greyColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: Pallete.greyColor,
                    thickness: 0.15,
                  )
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
