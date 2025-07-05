import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final bool? enable;
  final Color? textColor;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final String? text;
  final Color? borderColor;

  const Button(
      {@required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.radius,
      this.enable = true,
      this.textColor,
      this.prefixicon,
      this.suffixicon,
      this.text,
      this.borderColor = AppColors.transparent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enable == true ? onPressed : null,
      child: Container(
        height: height ?? 50.h,
        width: width ?? MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            border: Border.all(
                color: enable! ? borderColor! : AppColors.transparent),
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixicon ?? const SizedBox(),
            Center(
                child: Text(text ?? '',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14.sp,
                        fontFamily: AppTextStyles.fontFamily,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: textColor ?? AppColors.white))),
            suffixicon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
