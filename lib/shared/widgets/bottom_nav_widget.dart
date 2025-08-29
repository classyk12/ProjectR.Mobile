import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/themes/app_colors.dart';

class BottomNavWidget extends ConsumerWidget {
  final int selectedIndex;
  BottomNavWidget({super.key, required this.selectedIndex});
  int? currentIndex;
  ThemeData? currentTheme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    currentTheme = ref.watch(themeProvider).currentTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                //  AutoRouter.of(context).push(const HomeRoute());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppHelper.getImageFullPath('home.png'),
                    color: selectedIndex == 0
                        ? currentTheme!.primaryColor
                        : AppColors.lightGrey,
                    width: 25,
                    height: 25,
                  ).paddingSymmetric(vertical: 10.h),
                  Text('  Home',
                          style: TextStyle(
                              color: selectedIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : AppColors.lightGrey,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600))
                      .paddingOnly(bottom: 10.h)
                ],
              )),
          InkWell(
            onTap: () {
              AutoRouter.of(context).push(const HomeRoute());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppHelper.getImageFullPath('appointment.png'),
                  color: selectedIndex == 1
                      ? currentTheme!.primaryColor
                      : AppColors.lightGrey,
                  width: 24,
                  height: 24,
                ).paddingSymmetric(vertical: 10.h),
                Text('Appointment',
                        style: TextStyle(
                            color: selectedIndex == 1
                                ? currentTheme!.primaryColor
                                : AppColors.lightGrey,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600))
                    .paddingOnly(bottom: 10.h)
              ],
            ).paddingOnly(left: 20.w),
          ),
          InkWell(
            onTap: () {
              // AutoRouter.of(context).push(const DashboardReportRoute());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppHelper.getImageFullPath('profile.png'),
                  color: selectedIndex == 2
                      ? currentTheme!.primaryColor
                      : AppColors.lightGrey,
                  width: 24,
                  height: 24,
                ).paddingSymmetric(vertical: 10.h),
                Text('Profile',
                        style: TextStyle(
                            color: selectedIndex == 2
                                ? currentTheme!.primaryColor
                                : AppColors.lightGrey,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600))
                    .paddingOnly(bottom: 10.h)
              ],
            ).paddingOnly(left: 20.w),
          ),
        ],
      ).paddingOnly(bottom: 10.h),
    ).paddingSymmetric(horizontal: 30.w);
  }
}
