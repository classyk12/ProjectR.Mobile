import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:projectr/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class TextFieldWithLabelWidget extends StatelessWidget {
  final String title;
  final String labelText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextInputType keyboardType;
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
      this.validator,
      this.suffixWidget,
      this.enabled = true,
      this.disabledBorderColor,
      this.prefixWidget});

  @override
  Widget build(BuildContext context) {
    return _dataField(context,
        title: title,
        labelText: labelText,
        prefixWidget: prefixWidget,
        enabled: enabled!,
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
  Widget? prefixWidget,
  Widget? suffixWidget,
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
                        fontFamily: AppTextStyles.fontFamily2,
                        color: Theme.of(context).textTheme.bodyLarge!.color!))
                .paddingSymmetric(vertical: 10.h),
            Text(' *',
                    style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily2,
                        color: validator == null
                            ? AppColors.transparent
                            : AppColors.red))
                .paddingSymmetric(vertical: 10.h),
          ],
        ),
        TextInput(
            enabled: enabled,
            labelText: labelText,
            labelTextColor: AppColors.lightGrey,
            borderColor: AppColors.textFieldBorderColor,
            validator: validator,
            labelBehavior: FloatingLabelBehavior.never,
            focusNode: null,
            prefixWidget: prefixWidget,
            controller: controller,
            disabledBorderColor: disabledBorderColor,
            keyboardType: keyboardType,
            suffixWidget: suffixWidget,
            isPassword: false,
            textColor: Theme.of(context).textTheme.bodyLarge!.color)
      ]).paddingSymmetric(vertical: 5.h);
}
