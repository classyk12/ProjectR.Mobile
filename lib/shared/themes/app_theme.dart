import 'package:projectr/shared/themes/app_colors.dart';
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
        primaryColor: const Color(0xff659AC9),
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.dark,
                primary: AppColors.primary, //Color(0xff9BC0FF),
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
