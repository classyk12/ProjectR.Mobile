import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/helpers/util.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/text_input.dart';

@RoutePage()
class SetupAvailabilityScreen extends ConsumerStatefulWidget {
  const SetupAvailabilityScreen({super.key});

  @override
  ConsumerState<SetupAvailabilityScreen> createState() =>
      _SetupAvailabilityScreenState();
}

class _SetupAvailabilityScreenState
    extends ConsumerState<SetupAvailabilityScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider).currentTheme;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: currentTheme.appBarTheme.foregroundColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Set Your Availability',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: currentTheme.textTheme.bodyLarge!.color)),
                  Text('Skip',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: currentTheme.textTheme.bodyLarge!.color)),
                ],
              ).paddingOnly(top: 15.h, bottom: 10.h),
              Text(
                'Select days and times when you\'re available for bookings',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey),
              ).paddingOnly(bottom: 5.h),
              _availabilityCard(currentTheme, width, context),
              Button(
                onPressed: () {
                  AutoRouter.of(context)
                      .push(const SetupBusinessLocationRoute());
                },
                text: 'Save Availability',
                color: AppColors.primary,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
              ).paddingSymmetric(vertical: 20.h),
            ],
          ).paddingSymmetric(vertical: 50.h, horizontal: 20.w),
        ),
      ),
    );
  }

  Material _availabilityCard(
      ThemeData currentTheme, double width, BuildContext context) {
    return Material(
      shadowColor: AppColors.lightGrey.withOpacity(0.5),
      type: MaterialType.card,
      elevation: 1,
      // color: currentTheme.appBarTheme.foregroundColor,
      borderRadius: BorderRadius.circular(5.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Monday',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: currentTheme.textTheme.bodyLarge!.color)),
              Switch.adaptive(
                value: true,
                onChanged: (val) {},
                activeColor: currentTheme.textTheme.bodyLarge!.color,
                activeThumbImage:
                    AssetImage(AppHelper.getImageFullPath('done.png')),
              )
            ],
          ).paddingSymmetric(vertical: 5.h),
          Container(
            height: 1,
            color: AppColors.lightGrey.withOpacity(0.2),
          ).paddingSymmetric(vertical: 10.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _startTimeView(width, context, currentTheme),
            _endTimeView(width, context, currentTheme)
          ]).paddingOnly(top: 10.h),
          Text('Add Breaks',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: currentTheme.textTheme.bodyLarge!.color))
              .paddingOnly(top: 30.h, bottom: 0.h)
        ],
      ).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
    );
  }

  Widget _endTimeView(
      double width, BuildContext context, ThemeData currentTheme) {
    return SizedBox(
      width: width * .40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'End Time',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.darkGrey),
          ).paddingOnly(bottom: 5.h),
          InkWell(
            onTap: () async {
              var result = await showTimePicker(
                  context: context,
                  initialEntryMode: TimePickerEntryMode.dial,
                  initialTime: TimeOfDay.now());
              if (result != null) {
                customDebugPrint(message: '${result.hour} ${result.minute}');
                _controller.text = '${result.hour}:${result.minute}';
              }
            },
            child: TextInput(
              controller: _controller,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              textSize: 18.sp,
              textColor: currentTheme.textTheme.bodyLarge!.color,
              disabledBorderColor: AppColors.lightGrey.withOpacity(0.3),
              enabled: false,
              suffixWidget: const RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.chevron_left,
                    size: 25,
                    color: AppColors.darkGrey,
                  )),
              borderColor: AppColors.lightGrey,
            ),
          )
        ],
      ),
    );
  }

  SizedBox _startTimeView(
      double width, BuildContext context, ThemeData currentTheme) {
    return SizedBox(
      width: width * .40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Start Time',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.darkGrey),
          ).paddingOnly(bottom: 5.h),
          InkWell(
            onTap: () async {
              var result = await showTimePicker(
                  context: context,
                  initialEntryMode: TimePickerEntryMode.dial,
                  initialTime: TimeOfDay.now());
              if (result != null) {
                customDebugPrint(message: '${result.hour} ${result.minute}');
                _controller.text = '${result.hour}:${result.minute}';
              }
            },
            child: TextInput(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              controller: _controller,
              textSize: 18.sp,
              textColor: currentTheme.textTheme.bodyLarge!.color,
              disabledBorderColor: AppColors.lightGrey.withOpacity(0.3),
              enabled: false,
              suffixWidget: const RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.chevron_left,
                    size: 25,
                    color: AppColors.darkGrey,
                  )),
              borderColor: AppColors.lightGrey,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
