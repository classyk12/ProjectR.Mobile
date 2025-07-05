// import 'package:projectr/providers/app_theme_provider.dart';
// import 'package:projectr/shared/themes/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/utils.dart';

// //

// PreferredSize customAppBar(
//   BuildContext context,
//   WidgetRef ref, {
//   Color color = AppColors.primary,
//   Widget? leading,
//   String? title = '',
//   bool centerTitle = true,
//   List<Widget> actions = const [],
//   Color textColor = AppColors.black,
//   double? height,
//   VoidCallback? onLeadingTap,
// }) {
//   var currentTheme = ref.watch(themeProvider).currentTheme;

//   return PreferredSize(
//     preferredSize: Size(MediaQuery.sizeOf(context).width, height ?? 0.h),
//     child: AppBar(
//       bottom: null,
//       elevation: 0,
//       centerTitle: centerTitle,
//       backgroundColor: color,
//       leading: leading ??
//           InkWell(
//             onTap: onLeadingTap ?? () => Navigator.pop(context),
//             child: CircleAvatar(
//               backgroundColor: currentTheme.primaryColor.withOpacity(0.3),
//               child: Icon(Icons.arrow_back,
//                   color: currentTheme.primaryColor, size: 25.sp),
//             ),
//           ).paddingOnly(left: 15.w),
//       title: Text(title ?? '',
//           style: TextStyle(
//               fontSize: 18, color: textColor, fontWeight: FontWeight.w600)),
//       actions: actions,
//     ),
//   );
// }

// class CustomAppBar extends ConsumerWidget {
//   final Color? color;
//   final Widget? leading;
//   final String? title;
//   final bool? centerTitle;
//   final List<Widget> actions;
//   final Color textColor;
//   final double? height;
//   final VoidCallback? onLeadingTap;

//   const CustomAppBar({
//     super.key,
//     this.color = AppColors.primary,
//     this.leading,
//     this.title = '',
//     this.centerTitle = true,
//     this.actions = const [],
//     this.textColor = AppColors.black,
//     this.height,
//     this.onLeadingTap,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var currentTheme = ref.watch(themeProvider).currentTheme;
//     return PreferredSize(
//       preferredSize: Size(MediaQuery.sizeOf(context).width, height ?? 0.h),
//       child: AppBar(
//         bottom: null,
//         elevation: 0,
//         centerTitle: centerTitle,
//         backgroundColor: color,
//         leading: leading ??
//             CircleAvatar(
//               backgroundColor: currentTheme.primaryColor.withOpacity(0.3),
//               child: InkWell(
//                   onTap: onLeadingTap ?? () => Navigator.pop(context),
//                   child: Icon(Icons.arrow_back,
//                       color: currentTheme.primaryColor, size: 25.sp)),
//             ).paddingOnly(left: 15.w),
//         title: Text(title ?? '',
//             style: TextStyle(
//                 fontSize: 18, color: textColor, fontWeight: FontWeight.w600)),
//         actions: actions,
//       ),
//     );
//   }
// }
