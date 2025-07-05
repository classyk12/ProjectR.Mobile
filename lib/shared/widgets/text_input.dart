import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInput extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Color? textColor;
  final double? borderWidth;
  final FocusNode? focusNode;
  final String? hintText;
  final String? Function(String?)? validator;
  final double? labelFontSize;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color? labelTextColor;
  final IconData? icon;
  final double? hintTextSize;
  final bool? isPassword;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? onChanged;
  final double? textSize;
  final Color? color;
  final bool readOnly;
  final bool? enabled;
  final int? maxLines;
  final int? maxLenght;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final TextAlign? hintTextAlign;
  final Alignment? labelTextAlign;

  final String? labelText;
  final FloatingLabelBehavior? labelBehavior;

  const TextInput({
    super.key,
    @required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.labelFontSize,
    this.hintTextSize,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.icon,
    this.borderWidth,
    this.borderColor = AppColors.lightGrey,
    this.focusedBorderColor,
    this.labelTextColor,
    this.enabled,
    this.isPassword,
    this.inputFormatters,
    this.labelText,
    this.textColor,
    this.disabledBorderColor,
    this.contentPadding,
    this.focusNode,
    this.maxLines = 1,
    this.onChanged,
    this.textSize = 12,
    this.maxLenght = 100,
    this.color = AppColors.transparent,
    this.readOnly = false,
    this.labelBehavior = FloatingLabelBehavior.auto,
    this.textAlign,
    this.hintTextAlign,
    this.labelTextAlign,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLenght,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      cursorColor: Theme.of(context).textTheme.bodyLarge!.color,
      enabled: widget.enabled ?? true,
      validator: widget.validator,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword ?? false,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      //    keyboardAppearance: ThemeMode.,
      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.textSize ?? 14.sp,
      ),
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
          counterText: '',
          floatingLabelBehavior: widget.labelBehavior,
          fillColor: widget.color,
          filled: true,
          hintText: widget.hintText ?? '',
          hintStyle: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              color: AppColors.red,
              fontWeight: FontWeight.w500,
              fontSize: widget.hintTextSize ?? 14.h),
          labelText:
              widget.labelTextAlign == null ? widget.labelText ?? '' : null,
          labelStyle: widget.labelTextAlign == null
              ? TextStyle(
                  color: widget.labelTextColor ??
                      Theme.of(context).textTheme.bodyLarge!.color,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: widget.labelFontSize ?? 14.sp,
                  letterSpacing: 0.0)
              : null,
          label: widget.labelTextAlign == null
              ? null
              : Align(
                  alignment: widget.labelTextAlign ?? Alignment.centerLeft,
                  child: Text(
                    widget.labelText ?? '',
                    style: TextStyle(
                      color: widget.labelTextColor ??
                          Theme.of(context).textTheme.bodyLarge!.color,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: widget.labelFontSize ?? 14.sp,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
          isDense: true,
          errorStyle: const TextStyle(color: AppColors.red),
          prefixIcon: widget.prefixWidget,
          suffixIcon: widget.suffixWidget,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  color: AppColors.red, width: widget.borderWidth ?? 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  color: AppColors.red, width: widget.borderWidth ?? 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  color: widget.borderColor!, width: widget.borderWidth ?? 1)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  color: widget.disabledBorderColor ?? AppColors.transparent,
                  width: widget.borderWidth ?? 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  color: widget.focusedBorderColor ??
                      Theme.of(context).textTheme.bodyLarge!.color!,
                  width: widget.borderWidth ?? 1)),
          contentPadding: widget.contentPadding ?? EdgeInsets.all(15.sp)),
    );
  }
}
