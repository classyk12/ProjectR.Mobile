import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/helpers/validator.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/text_field_with_label_widget.dart';

@RoutePage()
class AuthenticationScreen extends ConsumerStatefulWidget {
  final bool isLogin;
  const AuthenticationScreen({super.key, required this.isLogin});

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String _selectedPhoneCode = '';
  String _selectedCountry = '';
  @override
  void initState() {
    isLogin = widget.isLogin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider).currentTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              ),
              Text(isLogin ? 'Welcome Back!' : 'Create Account',
                  style: TextStyle(
                      color: currentTheme.textTheme.bodyLarge!.color!)),
              Button(
                fontWeight: FontWeight.normal,
                onPressed: () async {},
                color: AppColors.transparent,
                borderColor: Colors.grey,
                text: ' Continue with Google',
                textColor: currentTheme.textTheme.bodyLarge!.color!,
                prefixicon:
                    Image.asset(AppHelper.getImageFullPath('google.png')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width * .4,
                      height: .5.h,
                      color: AppColors.primaryGrey),
                  const Text('Or',
                          style: TextStyle(color: AppColors.primaryGrey))
                      .paddingSymmetric(horizontal: 20.w),
                  Container(
                      width: width * .4,
                      height: .5.h,
                      color: AppColors.primaryGrey),
                ],
              ),
              TextFieldWithLabelWidget(
                  controller: TextEditingController(),
                  prefixWidget: SizedBox(
                    width: 50.w,
                    child: GestureDetector(
                      onTap: () {
                        _showCountryPicker(context);
                      },
                      child: Row(
                        children: [
                          RotatedBox(
                              quarterTurns: 3,
                              child: Icon(
                                Icons.chevron_left,
                                color: currentTheme.textTheme.bodyLarge!.color!,
                                size: 20,
                              )),
                          Text(
                            _selectedPhoneCode,
                          )
                        ],
                      ).paddingOnly(left: 10.w),
                    ),
                  ),
                  title: '',
                  labelText: 'Enter your phone number',
                  keyboardType: TextInputType.phone,
                  validator: (val) => Validator.validateDigit(val)),
              RichText(
                  text: TextSpan(
                text: 'Already have an account?',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                children: const <TextSpan>[
                  TextSpan(
                      text: '\'Free Tomorrow?\'',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ))
            ],
          ),
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
              color: AppColors.primaryGrey,
            ),
          ),
        ),
      ),
      onSelect: (Country ctry) {
        setState(() {
          _selectedPhoneCode = ctry.phoneCode;
          _selectedCountry = ctry.name;
        });
      },
    );
  }
}
