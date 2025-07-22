import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/helpers/validator.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/text_field_with_label_widget.dart';

@RoutePage()
class SetupBusinessLocationScreen extends ConsumerStatefulWidget {
  const SetupBusinessLocationScreen({super.key});

  @override
  ConsumerState<SetupBusinessLocationScreen> createState() =>
      _SetupBusinessLocationScreenState();
}

class _SetupBusinessLocationScreenState
    extends ConsumerState<SetupBusinessLocationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _businessName = TextEditingController();
  String _selectedPhoneCode = '';
  String _selectedCountry = '';

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
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.primary)),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding:
                        EdgeInsets.only(left: 20.w, right: 10.w, bottom: 30.h),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Business Location',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Text('Let\'s help people locate you',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white)),
                        ]),
                  ),
                ).paddingOnly(bottom: 40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Physical Location?',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: currentTheme.textTheme.bodyLarge!.color),
                        ).paddingOnly(bottom: 5.h),
                        Text('Let\'s help customers find you',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    color: currentTheme
                                        .textTheme.bodyLarge!.color))
                            .paddingOnly(bottom: 10.h),
                        TextFieldWithLabelWidget(
                            controller: TextEditingController(),
                            title: 'Do you offer on-site services?',
                            labelText: 'Select service type',
                            disabledBorderColor: AppColors.lightGrey,
                            suffixWidget: const RotatedBox(
                                quarterTurns: 3,
                                child: Icon(
                                  Icons.chevron_left,
                                  size: 25,
                                  color: AppColors.darkGrey,
                                )),
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                                Validator.validateDropdown(val)),
                        TextFieldWithLabelWidget(
                            controller: _businessName,
                            title: 'Enter your location',
                            labelText: 'Start typing....',
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                                Validator.validateDropdown(val)),
                        Container(
                          height: 200.h,
                          color: AppColors.primary,
                        ).paddingSymmetric(vertical: 15.h),
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
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const SetupBusinessDetailRoute());
                              },
                              text: 'Continue',
                              width: width * .45,
                              color: AppColors.primary,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ).paddingSymmetric(vertical: 20.h),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 10.w),
                  ],
                ).paddingSymmetric(vertical: 120.h),
              ],
            ),
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
