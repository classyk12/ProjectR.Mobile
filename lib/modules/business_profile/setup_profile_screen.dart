import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/shared/helpers/validator.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/themes/text_styles.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/text_input.dart';

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
      appBar: AppBar(
          automaticallyImplyLeading: false, backgroundColor: AppColors.primary),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
              ).paddingOnly(bottom: 40.h, top: 0),
              Text(
                'Business details',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: currentTheme.textTheme.bodyLarge!.color),
              ).paddingOnly(bottom: 5.h),
              TextInput(
                labelText: 'Enter your phone number',
                controller: _businessName,
                hintText: '',
                prefixWidget: SizedBox(
                  width: width * .25,
                  child: GestureDetector(
                    onTap: () => _showCountryPicker(context),
                    child: Row(
                      children: [
                        Text(_selectedPhoneCode).paddingOnly(left: 10.w),
                        const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.chevron_right, size: 20))
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
                  return val;
                },
                keyboardType: TextInputType.phone,
                enabled: true,
                isPassword: false,
                textColor: Theme.of(context).textTheme.bodyLarge!.color,
              ).paddingOnly(bottom: 20.h),
              Text(
                'Label 1',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff545555)),
              ).paddingOnly(bottom: 20.h, top: 5.h),
              Button(
                onPressed: () {},
                text: 'Continue',
                color: AppColors.primary,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
              ).paddingOnly(bottom: 20.h),
            ],
          ).paddingSymmetric(vertical: 10.h),
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
