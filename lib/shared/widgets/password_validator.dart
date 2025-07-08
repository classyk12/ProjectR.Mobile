import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:projectr/shared/themes/app_colors.dart';

Widget showPasswordValidationStatus(String text, BuildContext context,
    {bool status = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
              border: Border.all(
                  color: status == true
                      ? AppColors.transparent
                      : AppColors.primary),
              color: status == true
                  ? Theme.of(context)
                      .buttonTheme
                      .colorScheme!
                      .primary
                      .withAlpha(300)
                  : AppColors.transparent,
              shape: BoxShape.circle),
          child: status == true
              ? Icon(Icons.check,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  size: 13.sp)
              : const SizedBox(),
        ),
        SizedBox(width: 10.w),
        Text(text, style: const TextStyle(color: AppColors.primary))
      ],
    ),
  );
}

Widget passwordValidationWidget(
  BuildContext context, {
  bool is10Characters = false,
  bool isUppercase = false,
  bool isSpecialCharacter = false,
  bool isNumber = false,
}) {
  return Container(
    padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h, top: 15.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      border: Border.all(color: AppColors.primary, width: 0.3.w),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 10.h),
        Text(
          'Your password should contain:',
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600),
        ).paddingOnly(left: 10.w, bottom: 5.h),
        showPasswordValidationStatus('10 characters minumum', context,
            status: is10Characters),
        showPasswordValidationStatus('An Uppercase letter(a)', context,
            status: isUppercase),
        showPasswordValidationStatus('A special character(!@#)', context,
            status: isSpecialCharacter),
        showPasswordValidationStatus('A Number(1,2,3,etc)', context,
            status: isNumber),
        // SizedBox(height: 10.h),
      ],
    ),
  ).paddingSymmetric(horizontal: 15.w, vertical: 15.w);
}

class PasswordState {
  final String password;
  final bool has10Digits;
  final bool hasUpperCase;
  final bool hasSymbols;
  final bool hasDigits;
  final bool passwordVisible;
  final bool confirmPasswordVisible;
  final bool oldPasswordVisible;

  PasswordState({
    this.password = '',
    this.has10Digits = false,
    this.hasUpperCase = false,
    this.hasSymbols = false,
    this.hasDigits = false,
    this.passwordVisible = true,
    this.confirmPasswordVisible = true,
    this.oldPasswordVisible = true,
  });

  PasswordState copyWith({
    String? password,
    bool? has10Digits,
    bool? hasUpperCase,
    bool? hasSymbols,
    bool? hasDigits,
    bool? passwordVisible,
    bool? confirmPasswordVisible,
    bool? oldPasswordVisible,
  }) {
    return PasswordState(
      password: password ?? this.password,
      has10Digits: has10Digits ?? this.has10Digits,
      hasUpperCase: hasUpperCase ?? this.hasUpperCase,
      hasSymbols: hasSymbols ?? this.hasSymbols,
      hasDigits: hasDigits ?? this.hasDigits,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      confirmPasswordVisible:
          confirmPasswordVisible ?? this.confirmPasswordVisible,
      oldPasswordVisible: oldPasswordVisible ?? this.oldPasswordVisible,
    );
  }
}

class PasswordNotifier extends StateNotifier<PasswordState> {
  PasswordNotifier() : super(PasswordState());

  void updatePassword(String value) {
    state = state.copyWith(
      password: value,
      has10Digits: value.length >= 10,
      hasUpperCase: value.contains(RegExp(r'[A-Z]')),
      hasSymbols: value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
      hasDigits: value.contains(RegExp(r'[0-9]')),
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(passwordVisible: !state.passwordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state =
        state.copyWith(confirmPasswordVisible: !state.confirmPasswordVisible);
  }

  void toggleOldPasswordVisibility() {
    state = state.copyWith(oldPasswordVisible: !state.oldPasswordVisible);
  }
}

final passwordProvider =
    StateNotifierProvider.autoDispose<PasswordNotifier, PasswordState>(
  (ref) => PasswordNotifier(),
);
