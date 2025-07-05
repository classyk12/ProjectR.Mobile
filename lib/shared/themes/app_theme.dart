import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/no_swipe_page_transition_builder.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:projectr/shared/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: AppTextStyles.fontFamily,
        hintColor: AppColors.lightGrey,
        primaryColor: const Color(0xff659AC9),
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0xff659AC9), //Color(0xff9BC0FF),
                onPrimary: AppColors.primary,
                secondary: AppColors.secondary,
                onSecondary: AppColors.secondary,
                error: AppColors.red,
                onError: AppColors.red,
                surface: AppColors.primary,
                onSurface: AppColors.primary)),
        colorScheme: const ColorScheme.dark(
            primary: Color(0xff659AC9),
            secondary: Color(0xff1E1E1E),
            error: AppColors.red,
            brightness: Brightness.dark,
            secondaryContainer: Color(0xff1E1E1E),
            surface: AppColors.black,
            //this color represents success/greens for the theme
            tertiary: AppColors.green,
            //scaffold background Dashboard
            primaryContainer: Color(0xff161616),
            onPrimaryContainer: Color(0xff002564),
            //background color for bottom sheet contaoner background
            tertiaryContainer: Color(0xff1E1E1E),
            onSecondaryContainer: Color(0xff776EB8),
            //for kyc background
            inversePrimary: Color(0xff050540)),
        scaffoldBackgroundColor: AppColors.black,
        textTheme: TextThemes.darkTextTheme,
        primaryTextTheme: TextThemes.primaryTextTheme,
        iconTheme: const IconThemeData(color: AppColors.white),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.white, // Transparent status bar
            statusBarBrightness: Brightness.dark, // Dark text for status bar
          ),
          elevation: 0,
          backgroundColor: Color(0xff659AC9),
          foregroundColor: AppColors.black,
          titleTextStyle: AppTextStyles.h2,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color(0xff0D0D0D),
            modalBackgroundColor: AppColors.black));
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: AppTextStyles.fontFamily,
        primaryColor: AppColors.primary,
        hintColor: AppColors.lightGrey,
        iconTheme: const IconThemeData(color: AppColors.black),
        textTheme: TextThemes.primaryTextTheme,
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: AppColors.primary,
                onPrimary: AppColors.secondary,
                secondary: AppColors.secondary,
                onSecondary: AppColors.secondary,
                error: AppColors.red,
                onError: AppColors.red,
                surface: AppColors.primary,
                onSurface: AppColors.primary)),
        colorScheme: ColorScheme.light(
            brightness: Brightness.light,
            primary: AppColors.primary,
            secondary: AppColors.grey,
            surface: AppColors.white,
            secondaryContainer: const Color(0xffF3F3FE),
            error: AppColors.red,

            //this color represents success/greens for the theme
            tertiary: const Color(0xffDFF8EF),

            //scaffold background Dashboard
            primaryContainer: const Color(0xffEDEDFF),
            onPrimaryContainer: const Color(0xffD7D7FC),
            onSecondaryContainer: const Color(0xff675DB0),

            //background color for bottom sheet contaoner background
            tertiaryContainer: const Color(0xffEDEDFF).withBlue(500),
            inversePrimary: const Color(0xff8092B2)),
        scaffoldBackgroundColor: const Color(0xffE1E1E1),
        appBarTheme: AppBarTheme(
            systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: AppColors.white,
              statusBarColor: AppColors.white, // Transparent status bar
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light, // Dark text for status bar
            ),
            elevation: 0,
            backgroundColor: AppColors.primary.withOpacity(0.8),
            foregroundColor: AppColors.white),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: AppColors.white,
            modalBackgroundColor: AppColors.white));
  }
}

class ModuleThemes {
  /// General app Light Theme
  static ThemeData generalLightTheme = ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
          TargetPlatform.android: NoSwipePageTransitionBuilder(),
        },
      ),
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: ModuleColors.generalModuleColorLight['primary'],
      scaffoldBackgroundColor:
          ModuleColors.generalModuleColorLight['scaffold_background'],
      primaryColorLight:
          ModuleColors.generalModuleColorLight['foreground_color'],
      canvasColor:
          ModuleColors.generalModuleColorLight['description_background'],
      hintColor: ModuleColors.generalModuleColorLight[
          'kyc_green'], //use this for the kyc success background
      appBarTheme: AppBarTheme(
          foregroundColor:
              ModuleColors.generalModuleColorLight['foreground_color']),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ModuleColors
              .generalModuleColorLight['bottom_nav_background']!
              .withBlue(500)));

  /// General app Dark Theme
  static ThemeData generalDarkTheme = ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
          TargetPlatform.android: NoSwipePageTransitionBuilder(),
        },
      ),
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: ModuleColors.generalModuleColorDark['primary'],
      scaffoldBackgroundColor:
          ModuleColors.generalModuleColorDark['scaffold_background'],
      canvasColor:
          ModuleColors.generalModuleColorDark['description_background'],
      primaryColorLight:
          ModuleColors.generalModuleColorDark['foreground_color'],
      hintColor: ModuleColors.generalModuleColorDark[
          'kyc_green'], //use this for the kyc success background
      appBarTheme: AppBarTheme(
          foregroundColor:
              ModuleColors.generalModuleColorDark['foreground_color']),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor:
              ModuleColors.generalModuleColorLight['bottom_nav_background']!));

  /// Securities trading Light Theme
  static ThemeData securitiesLightTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
        TargetPlatform.android: NoSwipePageTransitionBuilder(),
      },
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTextStyles.fontFamily,
    primaryColor: ModuleColors.securitiesModuleColorLight['primary'],
    scaffoldBackgroundColor:
        ModuleColors.securitiesModuleColorLight['scaffold_background'],
    cardColor: ModuleColors.securitiesModuleColorLight['chart_bg_color'],
    secondaryHeaderColor:
        ModuleColors.securitiesModuleColorLight['background_blue'],
    canvasColor: ModuleColors.securitiesModuleColorLight['description_bg_blue'],
    primaryColorDark:
        ModuleColors.securitiesModuleColorLight['primary_color_dark'],
    primaryColorLight: ModuleColors.securitiesModuleColorLight['white'],
  );

  /// Securities trading Dark Theme
  static ThemeData securitiesDarkTheme = ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
          TargetPlatform.android: NoSwipePageTransitionBuilder(),
        },
      ),
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: ModuleColors.securitiesModuleColorDark['primary'],
      scaffoldBackgroundColor:
          ModuleColors.securitiesModuleColorDark['scaffold_background'],
      cardColor: ModuleColors.securitiesModuleColorDark['chart_bg_color'],
      secondaryHeaderColor:
          ModuleColors.securitiesModuleColorDark['background_blue'],
      canvasColor:
          ModuleColors.securitiesModuleColorDark['description_bg_blue'],
      primaryColorDark:
          ModuleColors.securitiesModuleColorDark['primary_color_dark'],
      primaryColorLight: ModuleColors.securitiesModuleColorDark['black']);

  /// Asset Management Light Theme
  static ThemeData assetManagementLightTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
        TargetPlatform.android: NoSwipePageTransitionBuilder(),
      },
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTextStyles.fontFamily,
    primaryColor: ModuleColors.assetManagementModuleColorLight['primary'],
    scaffoldBackgroundColor:
        ModuleColors.assetManagementModuleColorLight['scaffold_background'],
    cardColor: ModuleColors.assetManagementModuleColorLight['card_bg'],
    primaryColorDark: ModuleColors.assetManagementModuleColorLight['secondary'],
    canvasColor: ModuleColors.assetManagementModuleColorLight['secondary'],
  );

  /// Asset Management Dark Theme
  static ThemeData assetManagementDarkTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
        TargetPlatform.android: NoSwipePageTransitionBuilder(),
      },
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,
    primaryColor: ModuleColors.assetManagementModuleColorDark['primary'],
    scaffoldBackgroundColor:
        ModuleColors.assetManagementModuleColorDark['scaffold_background'],
    cardColor: ModuleColors.assetManagementModuleColorDark['card_bg'],
    primaryColorDark: ModuleColors.assetManagementModuleColorDark['secondary'],
    canvasColor: ModuleColors.assetManagementModuleColorDark['secondary'],
  );

  /// Mutual Funds Light Theme
  static ThemeData mutualFundLightTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
        TargetPlatform.android: NoSwipePageTransitionBuilder(),
      },
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTextStyles.fontFamily,
    primaryColor: ModuleColors.mutualFundsModuleColorLight['primary'],
    scaffoldBackgroundColor:
        ModuleColors.mutualFundsModuleColorLight['scaffold_background'],
    cardColor: ModuleColors.mutualFundsModuleColorLight['card_bg'],
    // textTheme: const TextTheme(bodyLarge: TextStyle(color: AppColors.white)),
    primaryColorDark: ModuleColors.mutualFundsModuleColorLight['secondary'],
    canvasColor: ModuleColors.mutualFundsModuleColorLight['secondary'],
  );

  /// Mutual Funds Dark Theme
  static ThemeData mutualFundDarkTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: NoSwipePageTransitionBuilder(),
        TargetPlatform.android: NoSwipePageTransitionBuilder(),
      },
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,
    primaryColor: ModuleColors.mutualFundsModuleColorDark['primary'],
    // textTheme: const TextTheme(bodyLarge: TextStyle(color: AppColors.black)),
    scaffoldBackgroundColor:
        ModuleColors.mutualFundsModuleColorDark['scaffold_background'],
    cardColor: ModuleColors.mutualFundsModuleColorDark['card_bg'],
    primaryColorDark: ModuleColors.mutualFundsModuleColorDark['secondary'],
    canvasColor: ModuleColors.mutualFundsModuleColorDark['secondary'],
  );
}
