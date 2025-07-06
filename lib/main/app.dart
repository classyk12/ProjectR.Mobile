import 'dart:async';
import 'package:projectr/main/flavors.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:projectr/routes/app_router.dart';
import 'package:projectr/shared/widgets/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:projectr/shared/helpers/helper.dart';
import 'package:flutter/services.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final appRouter = AppRouter();

  @override
  void initState() {
    //_initializeTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appThemeManager = ref.watch(themeProvider);
    final currentTheme = appThemeManager.currentTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // onTap: () => _initializeTimer(),
      // onPanDown: (_) => _initializeTimer(),
      // onPanUpdate: (_) => _initializeTimer(),
      child: DismissKeyboard(
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          ensureScreenSize: true,
          child: MaterialApp.router(
            title: F.shared.appName,
            theme: currentTheme,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }

  // void _initializeTimer() {
  //   if (_timer != null) {
  //     _timer!.cancel();
  //   }
  //   // setup action after 10 minutes
  //   _timer = Timer(const Duration(minutes: 10), () {
  //     _timer?.cancel();
  //     _timer = null;
  //     ref.read(themeProvider.notifier).switchModule(AppModule.general);
  //     appRouter.replaceAll([const LoginRoute()]);
  //   });
  // }
}

Future<void> loadApp(F appFlavour) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await AppHelper.loadConfigs(appFlavour.flavor);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const ProviderScope(
    // observers: [Observers()],
    child: MyApp(),
  ));
}
