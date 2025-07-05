// import 'package:auto_route/auto_route.dart';
// import 'package:projectr/app_states/global_states/global_app_state.dart';
// import 'package:projectr/modules/authentication/providers/login_provider.dart';
// import 'package:projectr/modules/dashboard/providers/dashboard_provider.dart';
// import 'package:projectr/providers/app_theme_provider.dart';
// import 'package:projectr/routes/app_router.gr.dart';
// import 'package:projectr/shared/helpers/encryption_helper.dart';
// import 'package:projectr/shared/helpers/validator.dart';
// import 'package:projectr/shared/themes/app_colors.dart';
// import 'package:projectr/shared/widgets/app_bar.dart';
// import 'package:projectr/shared/widgets/app_header_widget.dart';
// import 'package:projectr/shared/widgets/button.dart';
// import 'package:projectr/shared/widgets/text_input.dart';
// import 'package:projectr/shared/widgets/toasts.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/utils.dart';
// import 'package:loading_overlay/loading_overlay.dart';

// @RoutePage()
// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _custId = TextEditingController();
//   final _password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final currentTheme = ref.watch(themeProvider).currentTheme;
//     final state = ref.watch(authStateNotifierProvider);
//     final loginUser = ref.watch(loginUserProvider);

//     ref.listen(
//       authStateNotifierProvider.select((value) => value),
//       ((previous, next) {
//         //show Snackbar on failure
//         if (next is Failure) {
//           ScaffoldMessenger.of(context).showSnackBar(showToast(
//             message: next.exception.error.toString(),
//           ));
//         } else if (next is Success) {
//           //Eager load customer involvements
//           ref.read(socketStreamProvider.future);
//           ref.read(productTypesProvider.future);
//           AutoRouter.of(context).replaceAll([const DashboardHomeRoute()]);
//           ref.watch(isPasswordProvider.notifier).state = true;
//         }
//       }),
//     );

//     return LoadingOverlay(
//       isLoading: state is Loading,
//       child: Scaffold(
//         backgroundColor: currentTheme.appBarTheme.foregroundColor,
//         appBar: customAppBar(context, ref,
//             height: 0, color: currentTheme.primaryColor),
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 AppHeaderWidget(
//                   currentTheme: currentTheme,
//                 ),
//                 loginUser == null
//                     ? Text(
//                         'Welcome',
//                         style: TextStyle(
//                             color: Theme.of(context).textTheme.bodyLarge!.color,
//                             fontSize: 28.sp,
//                             fontWeight: FontWeight.w600),
//                       ).paddingOnly(top: 50.h, bottom: 50.h)
//                     : const SizedBox(),
//                 loginUser.when(data: (data) {
//                   return Text('Welcome ${data != null ? 'back,' : ''}',
//                           style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodyLarge!.color,
//                               fontSize: 28.sp,
//                               fontWeight: FontWeight.w600))
//                       .paddingOnly(top: 50.h);
//                 }, error: (error, trace) {
//                   return const SizedBox();
//                 }, loading: () {
//                   return const SizedBox();
//                 }),
//                 loginUser.when(data: (data) {
//                   return Text(
//                           data != null
//                               ? '${data.firstName} ${data.lastName}'
//                               : '',
//                           style: TextStyle(
//                               color: Theme.of(context)
//                                   .textTheme
//                                   .displayLarge!
//                                   .color,
//                               fontSize: 28.sp,
//                               fontWeight: FontWeight.w600))
//                       .paddingOnly(bottom: 50.h);
//                 }, error: (error, trace) {
//                   return const SizedBox();
//                 }, loading: () {
//                   return const SizedBox();
//                 }),
//                 TextInput(
//                         labelText: 'Cust ID or Email',
//                         borderColor: AppColors.textFieldBorderColor,
//                         validator: (value) => Validator.validateDefault(value),
//                         focusNode: null,
//                         controller: _custId,
//                         keyboardType: TextInputType.text,
//                         isPassword: false,
//                         textColor: Theme.of(context).textTheme.bodyLarge!.color)
//                     .paddingSymmetric(vertical: 20.h, horizontal: 10.w),
//                 TextInput(
//                   borderColor: AppColors.textFieldBorderColor,
//                   validator: (value) => Validator.validateDefault(value),
//                   icon: Icons.remove_red_eye_sharp,
//                   focusNode: null,
//                   controller: _password,
//                   labelText: 'Password',
//                   keyboardType: TextInputType.text,
//                   isPassword: ref.watch(isPasswordProvider),
//                   textColor: Theme.of(context).textTheme.bodyLarge!.color,
//                   suffixWidget: InkWell(
//                     onTap: () => ref.read(isPasswordProvider.notifier).state =
//                         !ref.read(isPasswordProvider.notifier).state,
//                     child: Icon(
//                       Icons.remove_red_eye,
//                       color: Theme.of(context).iconTheme.color,
//                       size: 20.h,
//                     ),
//                   ),
//                 ).paddingSymmetric(horizontal: 10.w),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: InkWell(
//                     onTap: () =>
//                         AutoRouter.of(context).push(const ResetPasswordRoute()),
//                     child: Text('Reset Password',
//                         style: TextStyle(
//                             color:
//                                 Theme.of(context).textTheme.displayLarge!.color,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 14.sp)),
//                   ),
//                 ).paddingSymmetric(vertical: 20.h, horizontal: 10.w),
//                 SizedBox(
//                   height: 1.h,
//                   width: double.infinity,
//                 ).paddingSymmetric(vertical: 50.h),
//                 // InkWell(
//                 //   onTap: () {},
//                 //   child: Row(
//                 //       mainAxisAlignment: MainAxisAlignment.center,
//                 //       children: [
//                 //         SvgPicture.asset('assets/images/face_id.svg',
//                 //                 height: 40.h,
//                 //                 width: 40.w,
//                 //                 semanticsLabel: 'Sign in with face Id')
//                 //             .paddingSymmetric(horizontal: 10.w),
//                 //         Text('Sign in with Face ID',
//                 //             style: TextStyle(
//                 //                 color: Theme.of(context)
//                 //                     .textTheme
//                 //                     .bodyLarge!
//                 //                     .color,
//                 //                 fontWeight: FontWeight.w600,
//                 //                 fontSize: 14.sp))
//                 //       ]),
//                 // ).paddingSymmetric(vertical: 50.h),
//                 Button(
//                   height: 56.h,
//                   color: currentTheme.primaryColor,
//                   onPressed: () {
//                     // IEncryptionHelper encryptionHelper = EncryptionHelper();
//                     // final decrypted = encryptionHelper.decryptPayload(
//                     //     "nC+vUxZvrQblL0VR9U8e9Yg2JcmIkHzj1AtC1NEBtA9kjlxEkZnWWiLJVFtBjYj91bnKkFNdzwyunGbHwT8QniEcIcdvx3hWCMImY767Ppn+kvkT/SFcv5OemZKjASYkZgjytd+95a7A3bFUbBBA0eIh/bcHtzr/T0B3mDglk54IhJRQ2fzIuJfo2ojS8cJHxaDw1XY35aU6dZWus5o5kteKKAhSuK1xA4axv7a9fii+0KkZNFHQIomXK9W9I/2679H48Q6t5zv1Nx8GvQmcz4Gwm8kJgVqbhbnylrBcwrcqMTLnVlHOPAf4Ouh7MdEhouodCON+MGz9+Wq37t/ivevnTRQmSh2b/BKXqLx7RMKjUU1mlwkQ87UWlElwEFgez9eNQZBF6zmkAJJB2qj+zwpn7WesB62nADpyOjC6/rcEppv6+onXKfh+6zrHJvdr");

//                     // print(decrypted);

//                     if (_formKey.currentState!.validate()) {
//                       ref.read(authStateNotifierProvider.notifier).loginUser(
//                           userName: _custId.text, password: _password.text);
//                     }
//                   },
//                   text: 'Login',
//                 ).paddingOnly(bottom: 20.h, left: 10.w, right: 10.w),
//                 GestureDetector(
//                   onTap: () => AutoRouter.of(context)
//                       .push(const AccountSelectionRoute()),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Don\'t have an account?',
//                           style: TextStyle(
//                             color: Theme.of(context).textTheme.bodyLarge!.color,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w600,
//                           )),
//                       Text(' Sign Up',
//                           style: TextStyle(
//                             color:
//                                 Theme.of(context).textTheme.displayLarge!.color,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w600,
//                           )),
//                     ],
//                   ).paddingOnly(bottom: 50.h),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
