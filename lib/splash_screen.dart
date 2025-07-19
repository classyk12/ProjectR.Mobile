import 'package:auto_route/auto_route.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/data/local/shared_pref_service.dart';
import 'package:projectr/shared/domain/providers/shared_preference_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/themes/app_colors.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  dynamic nextScreen(BuildContext context, SharedPrefsService service) async {
    // var isvisited = await service.has(VISITED_STORAGE_KEY);

    Future.delayed(const Duration(seconds: 1), () {
      if (context.mounted) {
        AutoRouter.of(context)
            .pushAndPopUntil(const OnboardingRoute(), predicate: (_) => false);
        // if (isvisited) {
        //   AutoRouter.of(context)
        //       .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
        // } else {
        //   AutoRouter.of(context).pushAndPopUntil(const OnboardingRoute(),
        //       predicate: (_) => false);
        // }
      }
    });
  }

  @override
  void initState() {
    var state = ref.read(storageServiceProvider);
    nextScreen(context, state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppHelper.getImageFullPath(
                  'splash.jpeg',
                ),
              ))),
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppHelper.getImageFullPath(
              'logo.png',
            ),
            width: 89.w,
            height: 75.h,
            color: Colors.white,
          ),
          Text('ProjectR',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    ));
  }
}
