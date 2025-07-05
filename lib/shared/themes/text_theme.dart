import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TextThemes {
  /// Main text theme

  static TextTheme get textTheme {
    return const TextTheme(
      bodyLarge: AppTextStyles.bodyLg,
      bodyMedium: AppTextStyles.body,
      titleMedium: AppTextStyles.bodySm,
      titleSmall: AppTextStyles.bodyXs,
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      headlineMedium: AppTextStyles.h4,
    );
  }

  /// Dark text theme

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.white),
      titleMedium: AppTextStyles.bodySm.copyWith(color: AppColors.white),
      titleSmall: AppTextStyles.bodyXs.copyWith(color: AppColors.white),
      displayLarge: AppTextStyles.h1.copyWith(color: const Color(0xff659AC9)),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.white),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.white),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.white),
    );
  }

  /// Primary text theme

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.black),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.primary),
      titleMedium: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
      titleSmall: AppTextStyles.bodyXs.copyWith(color: AppColors.primary),
      displayLarge: AppTextStyles.h1.copyWith(color: AppColors.primary),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.primary),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.primary),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.primary),
    );
  }
}
