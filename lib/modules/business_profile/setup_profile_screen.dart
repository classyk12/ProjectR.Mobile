import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/helpers/validator.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/text_field_with_label_widget.dart';

@RoutePage()
class SetupBusinessProfileScreen extends ConsumerStatefulWidget {
  const SetupBusinessProfileScreen({super.key});

  @override
  ConsumerState<SetupBusinessProfileScreen> createState() =>
      _SetupBusinessProfileScreenState();
}

class _SetupBusinessProfileScreenState
    extends ConsumerState<SetupBusinessProfileScreen> {
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
                        color: currentTheme.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Setup Business Profile',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          Text(
                              'Let\'s get your business ready to accept appointments',
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
                          'Business details',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: currentTheme.textTheme.bodyLarge!.color),
                        ).paddingOnly(bottom: 5.h),
                        TextFieldWithLabelWidget(
                            controller: _businessName,
                            title: 'Business Name',
                            labelText: 'Enter your business name',
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                                Validator.validateDropdown(val)),
                        TextFieldWithLabelWidget(
                            controller: TextEditingController(),
                            title: 'Business Type',
                            labelText: 'Select your business type',
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
                            controller: TextEditingController(),
                            title: 'Phone Number',
                            disabledBorderColor: AppColors.lightGrey,
                            labelText: 'Enter your phone number',
                            prefixWidget: SizedBox(
                              width: width * .25,
                              child: GestureDetector(
                                onTap: () => _showCountryPicker(context),
                                child: Row(
                                  children: [
                                    Text(_selectedPhoneCode,
                                        style: const TextStyle(
                                          color: AppColors.darkGrey,
                                        )).paddingOnly(left: 10.w),
                                    const RotatedBox(
                                        quarterTurns: 1,
                                        child: Icon(
                                          Icons.chevron_right,
                                          size: 20,
                                          color: AppColors.darkGrey,
                                        )).paddingOnly(right: 10.w),
                                    Container(
                                        width: 1,
                                        height: 30.h,
                                        color: AppColors.lightGrey),
                                  ],
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                                Validator.validateDropdown(val)),
                        TextFieldWithLabelWidget(
                            controller: TextEditingController(),
                            title: 'Industry',
                            labelText: 'Select your industry',
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
                            controller: TextEditingController(),
                            title: 'About Business',
                            maxLines: 5,
                            labelText:
                                'Tell us about your business, products or services you offer',
                            disabledBorderColor: AppColors.lightGrey,
                            enabled: true,
                            keyboardType: TextInputType.text,
                            validator: (val) => Validator.validateDefault(val)),
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
              ],
            ),
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

  @override
  void dispose() {
    super.dispose();
  }
}
