import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class AppOtpFieldStyles {
  static PinTheme defaultPinTheme(
    BuildContext context, {
    double? height,
    double? width,
    double? borderWidth,
    double? fontSize,
  }) {
    return PinTheme(
      width: width?.w ?? 50.w,
      height: height?.h ?? 50.h,
      textStyle: TextStyle(fontSize: fontSize ?? 18.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
            color: Theme.of(context).textTheme.displayLarge!.color!,
            width: borderWidth ?? 2),
      ),
    );
  }
}
