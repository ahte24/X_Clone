import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_clone/common/common.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/features/auth/controller/auth_controller.dart';
import 'package:x_clone/theme/pallete.dart';

class CreateTweetScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateTweetScreen(),
      );
  const CreateTweetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTweetScreenState();
}

class _CreateTweetScreenState extends ConsumerState<CreateTweetScreen> {
  final tweetTextController = TextEditingController();
  @override
  void dispose() {
    tweetTextController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(
            left: 10,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 30,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(
              right: 10,
            ),
            child: RoundedSmallButton(
              onTap: () {},
              label: 'Post',
              backgroundColor: Pallete.blueColor,
              textColor: Pallete.whiteColor,
            ),
          ),
        ],
      ),
      body: currentUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0)
                            .copyWith(top: 20, left: 13),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.profilePic),
                          radius: 20,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          controller: tweetTextController,
                          style: const TextStyle(fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: "What's happening?",
                            hintStyle: TextStyle(
                              color: Pallete.greyColor,
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Pallete.greyColor,
              width: 0.1,
            ),
          ),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(
              left: 15,
              top: 10,
              right: 15,
            ),
            child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AssetsConstants.galleryIcon,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: SvgPicture.asset(AssetsConstants.gifIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: SvgPicture.asset(AssetsConstants.emojiIcon),
          ),
        ]),
      ),
    );
  }
}
