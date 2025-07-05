// import 'package:projectr/providers/app_theme_provider.dart';
// import 'package:projectr/shared/themes/app_colors.dart';
// import 'package:projectr/shared/widgets/button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/utils.dart';

// class CustomDateRangePickerWidget extends ConsumerWidget {
//   final Function(DateRange?) onDateSelected;
//   final Function() onButtonPressed;
//   final DateTime minDate;
//   final DateTime maxDate;

//   const CustomDateRangePickerWidget(
//       {super.key,
//       required this.onDateSelected,
//       required this.onButtonPressed,
//       required this.minDate,
//       required this.maxDate});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var currentTheme = ref.watch(themeProvider).currentTheme;

//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           DateRangePickerWidget(
//               height: MediaQuery.of(context).size.height * .45,
//               minDate: minDate,
//               maxDate: maxDate,
//               minimumDateRangeLength: 2,
//               disabledDates: const [],
//               doubleMonth: false,
//               onDateRangeChanged: onDateSelected,
//               theme: CalendarTheme(
//                 monthTextStyle: TextStyle(
//                     color: Theme.of(context).textTheme.displayLarge!.color,
//                     fontWeight: FontWeight.bold),
//                 selectedColor: currentTheme.primaryColor,
//                 dayNameTextStyle: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).textTheme.displayLarge!.color),
//                 inRangeColor: currentTheme.primaryColor.withOpacity(.1),
//                 inRangeTextStyle: TextStyle(
//                     color: Theme.of(context).textTheme.displayLarge!.color,
//                     fontWeight: FontWeight.bold),
//                 selectedTextStyle: TextStyle(
//                     color: Theme.of(context).textTheme.displayLarge!.color,
//                     fontWeight: FontWeight.bold),
//                 todayTextStyle: TextStyle(
//                     color: Theme.of(context).textTheme.displayLarge!.color,
//                     fontWeight: FontWeight.bold),
//                 defaultTextStyle: TextStyle(
//                     color: Theme.of(context).textTheme.displayLarge!.color,
//                     fontWeight: FontWeight.bold),
//                 radius: 60,
//                 tileSize: 45.sp,
//                 disabledTextStyle: TextStyle(
//                     color: AppColors.grey.withOpacity(.6),
//                     fontWeight: FontWeight.bold),
//               )),
//           Button(
//             height: 56.h,
//             color: currentTheme.primaryColor,
//             onPressed: onButtonPressed,
//             text: 'Confirm Date',
//           ).paddingOnly(bottom: 20.h),
//         ]);
//   }
// }
