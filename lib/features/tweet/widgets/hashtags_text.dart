import 'package:flutter/material.dart';
import 'package:x_clone/theme/pallete.dart';

class HashtagText extends StatelessWidget {
  final String text;
  const HashtagText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textspan = [];
    text.split(' ').forEach(
      (element) {
        if (element.startsWith('#')) {
          textspan.add(TextSpan(
              text: '$element ',
              style: const TextStyle(
                color: Pallete.blueColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )));
        } else if (element.startsWith('www.') ||
            element.startsWith('https://') ||
            element.startsWith('http://')) {
          textspan.add(TextSpan(
              text: '$element ',
              style: const TextStyle(
                color: Pallete.blueColor,
                fontSize: 17,
              )));
        } else {
          textspan.add(TextSpan(
              text: '$element ',
              style: const TextStyle(
                fontSize: 15,
              )));
        }
      },
    );
    return RichText(
      text: TextSpan(
        children: textspan,
      ),
    );
  }
}
