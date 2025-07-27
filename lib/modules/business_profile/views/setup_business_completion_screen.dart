import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/button.dart';

@RoutePage()
class SetupBusinessCompletionScreen extends ConsumerStatefulWidget {
  const SetupBusinessCompletionScreen({super.key});

  @override
  ConsumerState<SetupBusinessCompletionScreen> createState() =>
      _SetupBusinessCompletionScreenState();
}

class _SetupBusinessCompletionScreenState
    extends ConsumerState<SetupBusinessCompletionScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppHelper.getImageFullPath('confetti.png'),
                    width: 80.w, height: 80.h)
                .paddingOnly(bottom: 20.h, top: 30.h),
            Text(
              'You are all Set, Steven!',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: currentTheme.textTheme.bodyLarge!.color),
            ).paddingOnly(bottom: 5.h),
            Text('Welcome Abroad',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: currentTheme.textTheme.bodyLarge!.color))
                .paddingOnly(bottom: 20.h),
            Text(
              'You\'ve just taken a bold step toward improving your\nbusiness efficiency. Let’s help you stay on top of your\nappointments and boost your productivity.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.darkGrey),
            ).paddingOnly(bottom: 5.h),
            Button(
              onPressed: () {
                AutoRouter.of(context).popAndPush(const HomeRoute());
              },
              text: 'Lets Get Started!',
              color: AppColors.primary,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
            ).paddingSymmetric(vertical: 20.h),
          ],
        ).paddingSymmetric(horizontal: 15.w).paddingSymmetric(vertical: 50.h),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
