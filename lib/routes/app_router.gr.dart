// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:projectr/modules/authentication/views/authentication_screen.dart'
    as _i1;
import 'package:projectr/onboarding_screen.dart' as _i2;
import 'package:projectr/splash_screen.dart' as _i3;

/// generated route for
/// [_i1.AuthenticationScreen]
class AuthenticationRoute extends _i4.PageRouteInfo<AuthenticationRouteArgs> {
  AuthenticationRoute({
    _i5.Key? key,
    required bool isLogin,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AuthenticationRoute.name,
          args: AuthenticationRouteArgs(
            key: key,
            isLogin: isLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthenticationRouteArgs>();
      return _i1.AuthenticationScreen(
        key: args.key,
        isLogin: args.isLogin,
      );
    },
  );
}

class AuthenticationRouteArgs {
  const AuthenticationRouteArgs({
    this.key,
    required this.isLogin,
  });

  final _i5.Key? key;

  final bool isLogin;

  @override
  String toString() {
    return 'AuthenticationRouteArgs{key: $key, isLogin: $isLogin}';
  }
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i4.PageRouteInfo<void> {
  const OnboardingRoute({List<_i4.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}
