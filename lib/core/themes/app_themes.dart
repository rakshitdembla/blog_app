import 'package:blog_app/core/constants/appfonts.dart';
import 'package:blog_app/core/constants/my_assets.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {

  AppThemes._();

  static final light = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primarycolor),
        useMaterial3: true,
        fontFamily: Appfonts.poppinsfont.fontFamily
      );

      static final dark = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.secondarycolor),
        useMaterial3: true,
        fontFamily: Appfonts.poppinsfont.fontFamily
      );
      
}