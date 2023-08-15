import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/theme/theme.dart';

class UIConstants{
  static AppBar appBar(){
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        // ignore: deprecated_member_use
        color: Pallete.blueColor,
        height: 30,
        
      ),
      centerTitle: true,
    );
  }
}