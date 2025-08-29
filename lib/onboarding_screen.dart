import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:projectr/routes/app_router.gr.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/local/shared_pref_service.dart';
import 'package:projectr/shared/domain/providers/shared_preference_service_provider.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:projectr/shared/widgets/indicator.dart';

@RoutePage()
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController? pageController =
      PageController(viewportFraction: 1, initialPage: 0);

  final int totalPages = 3;
  int _currentPage = 0;
  SharedPrefsService? state;

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);
    final currentTheme = themeState.currentTheme;
    state = ref.read(storageServiceProvider);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.transparent,
            child: PageView(
              allowImplicitScrolling: true,
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                _onBoarding1(currentTheme),
                _onBoarding2(currentTheme),
                _onBoarding3(currentTheme),
              ],
            ),
          ),
          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildPageIndicator(totalPages, _currentPage,
                      activeColor: Theme.of(context).primaryColor))
              .paddingSymmetric(vertical: 70.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              _getTitleText(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.sp,
                  color: AppColors.white),
            ),
          ).paddingOnly(bottom: 250.h),
          Align(alignment: Alignment.bottomCenter, child: _getSubtitleWidget())
              .paddingOnly(bottom: 190.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: Button(
              fontWeight: FontWeight.bold,
              width: MediaQuery.of(context).size.width * .85,
              onPressed: () async {
                await setVisited(true);
              },
              color: AppColors.white,
              text: 'Log into your account',
              textColor: currentTheme.primaryColor,
            ),
          ).paddingOnly(top: 20.h, bottom: 50.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: Button(
              fontWeight: FontWeight.bold,
              width: MediaQuery.of(context).size.width * .85,
              onPressed: () async {
                await setVisited(false);
              },
              color: currentTheme.primaryColor,
              text: 'Sign Up',
            ),
          ).paddingOnly(bottom: 115.h, top: 20.h),
        ],
      ),
    );
  }

  Widget _onBoarding1(ThemeData currentTheme) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppHelper.getImageFullPath('onboarding1.png')),
              fit: BoxFit.cover)),
    );
  }

  Widget _onBoarding2(ThemeData currentTheme) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppHelper.getImageFullPath('onboarding2.png')),
              fit: BoxFit.cover)),
    );
  }

  Widget _onBoarding3(ThemeData currentTheme) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppHelper.getImageFullPath('onboarding3.png')),
              fit: BoxFit.cover)),
    );
  }

  Future setVisited(bool isLogin) async {
    await state!.set(VISITED_STORAGE_KEY, 'true');
    if (context.mounted) {
      AutoRouter.of(context)
          .pushAndPopUntil(const AuthenticationRoute(), predicate: (_) => false);
    }
  }

  String _getTitleText() {
    switch (_currentPage) {
      case 0:
        return 'Book Services, Skip\n\tthe Back and Forth';
      case 1:
        return 'Your Time. Your Rules.\n\t\t\t\tAnd Your Space';

      default:
        return 'Need a Service?\n\t\tJust Tap & Go';
    }
  }

  Widget _getSubtitleWidget() {
    switch (_currentPage) {
      case 0:
        return RichText(
          text: TextSpan(
            text: '\t\t\t\t\tSkip the ',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            children: const <TextSpan>[
              TextSpan(
                  text: '\'Free Tomorrow?\'',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' texts.',
                  style: TextStyle(fontWeight: FontWeight.w500, height: 2)),
              TextSpan(
                  text: '\nSee thier schedule.',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              TextSpan(
                  text: 'Book in seconds.',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        );

      case 1:
        return RichText(
          text: TextSpan(
            text: 'Set your hours. Get Booked ',
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w500, height: 1.5),
            children: const <TextSpan>[
              TextSpan(
                  text: '\n\t\t\t\t\t\t\t\tNo chasing calls.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        );

      default:
        return RichText(
            text: TextSpan(
          text: '\t\t\tPick a time ',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          children: const <TextSpan>[
            TextSpan(
                text: 'book fast,',
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            TextSpan(
                text: '\nget a quick reminder. Easy.',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ));
    }
  }
}
