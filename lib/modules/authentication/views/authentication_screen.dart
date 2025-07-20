import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/helpers/validator.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/text_input.dart';

@RoutePage()
class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPhoneCode = '';
  String _selectedCountry = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider).currentTheme;
    final _phoneController = TextEditingController();
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: currentTheme.appBarTheme.foregroundColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h),
              Center(
                child: Image.asset(AppHelper.getImageFullPath('logo.png'),
                    width: 100.w, height: 100.h),
              ).paddingOnly(bottom: 40.h),
              Button(
                fontWeight: FontWeight.normal,
                onPressed: () async {},
                color: AppColors.transparent,
                borderColor: AppColors.lightGrey,
                fontSize: 12.sp,
                text: ' Continue with Google',
                textColor: AppColors.lightGrey,
                prefixicon:
                    Image.asset(AppHelper.getImageFullPath('google.png')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width * .3,
                      height: .5.h,
                      color: AppColors.lightGrey),
                  const Text('Or', style: TextStyle(color: AppColors.lightGrey))
                      .paddingSymmetric(horizontal: 20.w),
                  Container(
                      width: width * .38,
                      height: .5.h,
                      color: AppColors.lightGrey),
                ],
              ).paddingSymmetric(vertical: 10.h),
              TextInput(
                labelText: 'Enter your phone number',
                labelBehavior: FloatingLabelBehavior.never,
                labelFontSize: 12.sp,
                controller: _phoneController,
                labelTextColor: AppColors.lightGrey,
                hintText: '',
                prefixWidget: SizedBox(
                  width: width * .25,
                  child: GestureDetector(
                    onTap: () => _showCountryPicker(context),
                    child: Row(
                      children: [
                        Text(_selectedPhoneCode,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.lightGrey,
                            )).paddingOnly(left: 10.w),
                        const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.chevron_right,
                                    size: 20, color: AppColors.darkGrey))
                            .paddingOnly(right: 10.w),
                        Container(
                            width: 1, height: 50, color: AppColors.lightGrey),
                      ],
                    ),
                  ),
                ),
                borderColor: AppColors.lightGrey,
                focusedBorderColor: AppColors.lightGrey,
                validator: (value) => Validator.validatephone(value!),
                focusNode: null,
                onChanged: (val) {
                  // setState(() {
                  //   if (val == null || val.isEmpty) {}
                  // });

                  return val;
                },
                keyboardType: TextInputType.phone,
                enabled: true,
                isPassword: false,
                textColor: AppColors.lightGrey,
              ).paddingOnly(bottom: 20.h),
              Button( 
                onPressed: () {
                  _phoneController.text = _phoneController.text.trim();
                  AutoRouter.of(context).push(OtpRoute(
                    phoneNumber: _phoneController.text,
                    phoneCode: _selectedPhoneCode,
                  ));
                },
                text: 'Continue',
                color: AppColors.primary,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
              ).paddingOnly(bottom: 20.h),
            ],
          ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
        ),
      ),
    );
  }

  void _showCountryPicker(BuildContext context) {
    return showCountryPicker(
      showPhoneCode: false,
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 30,
        backgroundColor: Theme.of(context).colorScheme.surface,
        searchTextStyle: AppTextStyles.body,
        textStyle: AppTextStyles.body,
        bottomSheetHeight: MediaQuery.of(context).size.height * 0.7,
        padding:
            EdgeInsets.only(top: 10.h), // Optional. Country list modal height
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: const InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ),
      onSelect: (Country ctry) {
        setState(() {
          _selectedPhoneCode = '+${ctry.phoneCode}';
          _selectedCountry = ctry.name;
        });
      },
    );
  }
}
