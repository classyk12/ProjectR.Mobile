import 'package:flutter/material.dart';

class AppColors {
  /// App primary color
  static const Color primary = Color(0xff002564);

  /// App secondary color
  static const Color secondary = Color(0xff675DB0);

  /// App black color
  static const Color black = Colors.black; //Color(0xff14171A);
  /// App white color
  static const Color white = Color(0xffffffff);

  /// Light grey color
  static const Color lightGrey = Color(0xffAAB8C2);
  static const Color grey = Color(0xff60616D);
  static const Color companyGrey = Color(0xff9C9B9B);
  static const Color companySecondaryGrey = Color(0xff8E8E8E);

  /// Extra Light grey colors
  static const Color extraLightGrey = Color(0xffE1E8ED);

  ///App red color
  static const Color red = Colors.red;

  ///App green color
  static const Color green = Colors.green;
  static const Color companyGreen = Color(0xff14B81C);

  ///App transparent
  static const Color transparent = Colors.transparent;

  ///App transparent
  static const Color textFieldBorderColor = Color(0xff528DC2);

  ///App Upgrade Profile star color
  static const Color upgradeProfileStarColor = Color(0xFFFFC107);

  ///App Orange color
  static const Color orange = Color(0xFFFFA500);

  ///App Blue color
  static const Color editImagePurple = Color(0xFFEBEBFE);
}

class ModuleColors {
  /// General Dashboard Trading light mode colors
  static const generalModuleColorLight = {
    'primary': Color(
        0xff002564), //use for primary widgets like buttons and blue colored texts
    'scaffold_background': Color(
        0xFFF9F9F9), //use for the scaffold background for dashboard and others
    'description_background': Color(
        0xFF8092B2), //use this for container backgrounds for descriptions texts during trading
    'foreground_color': AppColors.white, //use this for appbar colors
    'kyc_green': Color(0xffDFF8EF), //use this for success kyc card
    'bottom_nav_background': Color(0xffEDEDFF),
    'card_bg': AppColors.white,
  };

  /// General Dashboard dark mode colors
  static const generalModuleColorDark = {
    'primary': Color(
        0xff659AC9), //use for primary widgets like buttons and blue colored texts
    'scaffold_background': Color(
        0xFF161616), //use for the scaffold background for dashboard and others
    'description_background': Color(
        0xFF050540), //use this for container backgrounds for descriptions texts during trading
    'foreground_color': AppColors.black,
    'kyc_green': AppColors.green, //use this for success kyc card,
    'bottom_nav_background': Color(0xff1E1E1E),
    'card_bg': Color(0xFF0D0D0D),
  };

  /// Securities Trading light mode colors
  static const securitiesModuleColorLight = {
    'primary': Color(
        0xff659AC9), //use for primary widgets like buttons and blue colored texts
    'chart_bg_color': Color(
        0xFF8E8E8E), //use this for the background for the porfolio charts on dashboard
    'scaffold_background': Color(
        0xFFF9F9F9), //use for the scaffold background for dashboard and others
    'background_blue':
        Color(0xFF97BBDA), //use this for appbar color for favourties/trading
    'description_bg_blue': Color(
        0xFFF3F3FE), //use this for container backgrounds for descriptions texts during trading
    'white': AppColors.white,
    'primary_color_dark': Color(0xff528DC2)
  };

  /// Securities Trading dark mode colors
  static const securitiesModuleColorDark = {
    'primary': Color(
        0xFF97BBDA), //use for primary widgets like buttons and blue colored texts_
    'chart_bg_color': Color(
        0xFF293644), //use this for the background for the porfolio charts on dashboard
    'scaffold_background': Color(
        0xFF131313), //use for the scaffold background for dashboard and others
    'background_blue': Color(
        0xFF131313), // use for appbar color of favourite/trading/more/watchlist
    'description_bg_blue': Color(
        0xFF131313), //use this for container backgrounds for descriptions texts during trading,
    'black': AppColors.black,
    'primary_color_dark': Color(0xff659AC9)
  };
  // Asset Management light mode colors
  static const assetManagementModuleColorLight = {
    'primary': Color(
        0xffEF9011), //use for primary widgets like buttons and blue colored texts

    'scaffold_background': Color(
        0xFFF9F9F9), //use for the scaffold background for dashboard and others
    'card_bg': AppColors
        .white, //use this for the background for the porfolio charts on dashboard
    'secondary': Color(0xFFCB9A60), //use this as secondary color
    'canvas': Color(
        0xFFFCE9CF), // use for appbar color of favourite/trading/more/watchlist
  };
  static const assetManagementModuleColorDark = {
    'primary': Color(
        0xFFF19A29), //use for primary widgets like buttons and blue colored texts_
    'secondary': Color(0xFFCB9A60), //use this as secondary color
    'card_bg': Color(
        0xFF0D0D0D), // use for appbar color of favourite/trading/more/watchlist
    'scaffold_background': Color(
        0xFF131313), //use for the scaffold background for dashboard and others
    'canvas': Color(
        0xFF131313), // use for appbar color of favourite/trading/more/watchlist
  };

  // Mutual Fund light mode colors
  static const mutualFundsModuleColorLight = {
    'primary': Color(
        0xffA4003B), //use for primary widgets like buttons and blue colored texts
    'secondary': Color(0xFFCF7997), //use for the colored icons background
    'card_bg': AppColors
        .white, //use this for the background for the porfolio charts on dashboard
    'scaffold_background': Color(0xFFF9F9F9),
    // 'scaffold_background': Color(
    //     0xFFE4B3C4), //use for the scaffold background for dashboard and others
    'canvas': Color(
        0xFFF9F9F9), //use for the scaffold background for dashboard and others
  };

  static const mutualFundsModuleColorDark = {
    'primary': Color(
        0xFFE4B3C4), //use for primary widgets like buttons and blue colored texts_
    'scaffold_background': Color(
        0xFF0D0D0D), //use for the scaffold background for dashboard and others
    'canvas': Color(
        0xFF131313), // use for appbar color of favourite/trading/more/watchlist
    'card_bg': Color(
        0xFF1E1E1E), // use for appbar color of favourite/trading/more/watchlist
    'secondary': Color(0xFFE4B3C4), //use this as secondary color
  };
}
