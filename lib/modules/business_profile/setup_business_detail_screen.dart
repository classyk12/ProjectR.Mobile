import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/button.dart';

@RoutePage()
class SetupBusinessDetailScreen extends ConsumerStatefulWidget {
  const SetupBusinessDetailScreen({super.key});

  @override
  ConsumerState<SetupBusinessDetailScreen> createState() =>
      _SetupBusinessDetailScreenState();
}

class _SetupBusinessDetailScreenState
    extends ConsumerState<SetupBusinessDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late ThemeData currentTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentTheme = ref.watch(themeProvider).currentTheme;
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
              Center(
                child: Image.asset(AppHelper.getImageFullPath('success.png'),
                    width: 80.w, height: 80.h),
              ).paddingOnly(bottom: 20.h),
              Center(
                child: Text(
                  'Your business profile is ready!',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: currentTheme.textTheme.bodyLarge!.color),
                ).paddingOnly(bottom: 5.h),
              ),
              Text('You\'ve successfully set up your business profile.\nNow you can start accepting appointments',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: currentTheme.textTheme.bodyLarge!.color))
                  .paddingOnly(bottom: 20.h, left: 15.w),
              Container(
                width: width,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: currentTheme.primaryColor.withOpacity(0.5))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _detailItem(
                          title: 'Business Name',
                          detail: 'Swaggs and More Gift Collection'),
                      _detailItem(
                          title: 'Business Location', detail: 'Abuja, Nigeria'),
                      _detailItem(
                          title: 'Phone Number', detail: '+158087366373'),
                      _detailItem(
                          title: 'Business Type',
                          detail: 'Sole Proprietorship'),
                      _detailItem(title: 'Industry', detail: 'E-Commerce'),
                      _detailItem(
                          title: 'About',
                          detail:
                              'We curate and sell at types of gifts for all types of occassions'),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    onPressed: () {
                      AutoRouter.of(context).back();
                    },
                    text: 'Back',
                    width: width * .2,
                    fontSize: 16.sp,
                    prefixicon: const Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: AppColors.darkGrey,
                    ),
                    color: AppColors.transparent,
                    textColor: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                  ).paddingSymmetric(vertical: 20.h),
                  Button(
                    onPressed: () {},
                    text: 'Finish',
                    width: width * .45,
                    color: AppColors.primary,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  ).paddingSymmetric(vertical: 20.h),
                ],
              ),
            ],
          )
              .paddingSymmetric(horizontal: 15.w)
              .paddingSymmetric(vertical: 120.h),
        ),
      ),
    );
  }

  Widget _detailItem({required String title, required String detail}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: AppColors.lightGrey, fontSize: 12.sp),
        ),
        Text(
          detail,
          style: TextStyle(
              color: currentTheme.textTheme.bodyLarge!.color, fontSize: 16.sp),
        ),
      ],
    ).paddingSymmetric(vertical: 15.h);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
