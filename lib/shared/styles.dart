import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static DropdownSuffixProps dropdownSuffixProps() => const DropdownSuffixProps(
      dropdownButtonProps: DropdownButtonProps(
          iconClosed:
              RotatedBox(quarterTurns: 1, child: Icon(Icons.chevron_right)),
          iconOpened:
              RotatedBox(quarterTurns: 3, child: Icon(Icons.chevron_right))));

  static DropDownDecoratorProps dropdownDecoratorProps(
          {String? labelText = ''}) =>
      DropDownDecoratorProps(
          decoration: InputDecoration(
              labelText: labelText,
              hintText: labelText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.red),
              )));

  static TextStyle dropdownItemTextStyle() => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: AppTextStyles.fontFamily);
}
