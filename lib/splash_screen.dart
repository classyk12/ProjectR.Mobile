// import 'package:auto_route/auto_route.dart';
// import 'package:projectr/routes/app_router.gr.dart';
// import 'package:projectr/shared/constants.dart';
// import 'package:projectr/shared/data/local/shared_pref_service.dart';
// import 'package:projectr/shared/domain/providers/shared_preference_service_provider.dart';
// import 'package:projectr/shared/helpers/helper.dart';
// import 'package:projectr/shared/themes/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_utils/get_utils.dart';

// @RoutePage()
// class SplashScreen extends ConsumerStatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   ConsumerState<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends ConsumerState<SplashScreen> {
//   dynamic nextScreen(BuildContext context, SharedPrefsService service) async {
//     var isvisited = await service.has(VISITED_STORAGE_KEY);

//     Future.delayed(const Duration(milliseconds: 250), () {
//       if (context.mounted) {
//         if (isvisited) {
//           AutoRouter.of(context)
//               .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
//         } else {
//           AutoRouter.of(context).pushAndPopUntil(const OnboardingRoute(),
//               predicate: (_) => false);
//         }
//       }
//     });
//   }

//   @override
//   void initState() {
//     var state = ref.read(storageServiceProvider);
//     nextScreen(context, state);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.surface,
//           image: DecorationImage(
//               fit: BoxFit.cover,
//               //  BoxFit.fitHeight,
//               image: AssetImage(
//                 AppHelper.getImageFullPath(
//                   'splash_background.png',
//                 ),
//               ))),
//       height: MediaQuery.sizeOf(context).height,
//       width: MediaQuery.sizeOf(context).width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Image.asset(
//             AppHelper.getImageFullPath('cardinalstone.png'),
//             width: 175.w,
//             height: 44.h,
//           ).paddingSymmetric(vertical: 100.h),
//           const Expanded(child: SizedBox()),
//           Text('Build your',
//               style: TextStyle(
//                   color: AppColors.black,
//                   fontSize: 35.sp,
//                   fontWeight: FontWeight.w600)),
//           Text('Financial future',
//               style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontSize: 35.sp,
//                   fontWeight: FontWeight.w600)),
//           Text('© 2023 Cardinal Stone. All rights reserved.',
//                   style: TextStyle(
//                       color: AppColors.grey,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500))
//               .paddingOnly(bottom: 50.h, top: 20.h)
//         ],
//       ),
//     ));
//   }
// }
