import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:projectr/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class TextFieldWithLabelWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String labelText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextInputType keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Color? disabledBorderColor;
  final bool? enabled;
  const TextFieldWithLabelWidget(
      {super.key,
      required this.title,
      required this.labelText,
      required this.keyboardType,
      required this.controller,
      this.titleColor,
      this.validator,
      this.maxLines,
      this.suffixWidget,
      this.enabled = true,
      this.disabledBorderColor,
      this.prefixWidget});

  @override
  Widget build(BuildContext context) {
    return _dataField(context,
        title: title,
        titleColor: titleColor ?? AppColors.primary,
        labelText: labelText,
        prefixWidget: prefixWidget,
        enabled: enabled!,
        maxLines: maxLines,
        suffixWidget: suffixWidget,
        validator: validator,
        disabledBorderColor: disabledBorderColor,
        keyboardType: keyboardType,
        controller: controller);
  }
}

Widget _dataField(
  BuildContext context, {
  required String title,
  required String labelText,
  required TextInputType keyboardType,
  required TextEditingController controller,
  Color? titleColor,
  Widget? prefixWidget,
  Widget? suffixWidget,
  int? maxLines,
  bool enabled = true,
  Color? disabledBorderColor,
  String? Function(String?)? validator,
}) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(title,
                    style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 10.sp,
                        color: Theme.of(context).textTheme.bodyLarge!.color))
                .paddingSymmetric(vertical: 10.h),
            Text('*',
                    style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 10.sp,
                        color: validator == null
                            ? AppColors.transparent
                            : Theme.of(context).textTheme.bodyLarge!.color))
                .paddingSymmetric(vertical: 10.h),
          ],
        ),
        TextInput(
            enabled: enabled,
            labelText: labelText,
            labelTextColor: AppColors.darkGrey,
            labelFontSize: 10.sp,
            hintTextSize: 10.sp,
            labelTextAlign: Alignment.topLeft,
            hintText: labelText,
            borderColor: Theme.of(context).textTheme.bodyLarge!.color,
            validator: validator,
            labelBehavior: FloatingLabelBehavior.never,
            focusNode: null,
            prefixWidget: prefixWidget,
            focusedBorderColor: Theme.of(context).textTheme.bodyLarge!.color,
            maxLines: maxLines ?? 1,
            controller: controller,
            disabledBorderColor: disabledBorderColor,
            keyboardType: keyboardType,
            suffixWidget: suffixWidget,
            isPassword: false,
            textColor: Theme.of(context).textTheme.bodyLarge!.color)
      ]).paddingSymmetric(vertical: 5.h);
}
