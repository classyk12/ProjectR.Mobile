import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/otp_text_field.dart';

@RoutePage()
class OtpScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String phoneCode;
  const OtpScreen(
      {super.key, required this.phoneNumber, required this.phoneCode});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  String _phoneNumber = '';
  String _phoneCode = '';
  Timer? _timer;
  bool _isTimerRunning = false;
  int timeLeftInSeconds = 120;

  @override
  void initState() {
    _phoneNumber = widget.phoneNumber;
    _phoneCode = widget.phoneCode;
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider).currentTheme;

    return Scaffold(
      backgroundColor: currentTheme.appBarTheme.foregroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            if (context.mounted) {
              AutoRouter.of(context).back();
            }
          },
          child: Icon(Icons.chevron_left,
                  size: 30.w, color: currentTheme.iconTheme.color)
              .paddingOnly(left: 20.w),
        ),
        toolbarHeight: 30.h,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Verify Your Phone Number',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: currentTheme.textTheme.bodyLarge!.color),
              ).paddingOnly(bottom: 5.h),
              RichText(
                text: TextSpan(
                  text: 'Enter the Six (6) digit code',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.textTheme.bodyLarge!.color),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' OTP ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentTheme.textTheme.bodyLarge!.color)),
                    TextSpan(
                        text: 'sent to',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            height: 2,
                            color: currentTheme.textTheme.bodyLarge!.color)),
                  ],
                ),
              ),
              Text(
                '$_phoneCode$_phoneNumber',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: currentTheme.textTheme.bodyLarge!.color),
              ).paddingOnly(bottom: 20.h, top: 5.h),
              Text(
                'OTP Code',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: currentTheme.textTheme.bodyLarge!.color),
              ).paddingOnly(bottom: 10.h),
              OTPInputField(
                obscureText: false,
                controller: _otpController,
                borderColor: currentTheme.textTheme.bodyLarge!.color!,
              ),
              _isTimerRunning
                  ? RichText(
                      text: TextSpan(
                        text: 'Didnt get the code? ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: currentTheme.textTheme.bodyLarge!.color),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'resend in ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  height: 2,
                                  color:
                                      currentTheme.textTheme.bodyLarge!.color)),
                          TextSpan(
                              text: getTimeLeft(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  height: 2,
                                  color:
                                      currentTheme.textTheme.bodyLarge!.color)),
                        ],
                      ),
                    ).paddingOnly(bottom: 20.h, top: 5.h)
                  : InkWell(
                      onTap: () {
                        if (context.mounted) {
                          _startTimer();
                        }
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Didnt get the code? ',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGrey),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Resend Code',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                    color: currentTheme.primaryColorDark)),
                          ],
                        ),
                      ).paddingOnly(bottom: 20.h, top: 5.h),
                    ),
              Button(
                onPressed: () {
                  _timer!.cancel();
                  AutoRouter.of(context)
                      .push(const SetupBusinessProfileRoute());
                },
                text: 'Continue',
                color: AppColors.primary,
                textColor: currentTheme.buttonTheme.colorScheme!.primary,
                fontWeight: FontWeight.bold,
              ).paddingOnly(bottom: 20.h),
            ],
          ).paddingSymmetric(horizontal: 30.w, vertical: 10.h),
        ),
      ),
    );
  }

  void _startTimer() {
    _isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeftInSeconds > 0) {
        setState(() {
          timeLeftInSeconds = timeLeftInSeconds - 1;
        });
      } else {
        _resetTimer();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _isTimerRunning = false;
      timeLeftInSeconds = 60;
    });
    _timer!.cancel();
  }

  String getTimeLeft() {
    if (timeLeftInSeconds <= 0) {
      return '';
    }

    final minutes = timeLeftInSeconds / 60;
    final seconds = timeLeftInSeconds % 60;

    debugPrint(minutes.toStringAsFixed(0));
    if (minutes.truncate() > 0) {
      return '${minutes.truncate()} minutes $seconds seconds';
    } else {
      return '${seconds.toStringAsFixed(0)} seconds';
    }
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
