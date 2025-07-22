import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/button.dart';

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
              title: Text('Setup Availability'),
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: Text('Skip'),
              backgroundColor: AppColors.primary)),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Business details',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: currentTheme.textTheme.bodyLarge!.color),
                    ).paddingOnly(bottom: 5.h),
                    Button(
                      onPressed: () {
                        AutoRouter.of(context)
                            .push(const SetupBusinessLocationRoute());
                      },
                      text: 'Continue',
                      color: AppColors.primary,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ).paddingSymmetric(vertical: 20.h),
                  ],
                ).paddingSymmetric(horizontal: 10.w),
              ],
            ).paddingSymmetric(vertical: 120.h),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
