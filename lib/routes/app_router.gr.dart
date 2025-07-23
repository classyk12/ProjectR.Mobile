// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:projectr/modules/authentication/views/authentication_screen.dart'
    as _i1;
import 'package:projectr/modules/authentication/views/otp_screen.dart' as _i3;
import 'package:projectr/modules/availability/views/setup_availability_screen.dart'
    as _i4;
import 'package:projectr/modules/business_profile/views/setup_business_detail_screen.dart'
    as _i5;
import 'package:projectr/modules/business_profile/views/setup_business_location_screen.dart'
    as _i6;
import 'package:projectr/modules/business_profile/views/setup_profile_screen.dart'
    as _i7;
import 'package:projectr/onboarding_screen.dart' as _i2;
import 'package:projectr/splash_screen.dart' as _i8;

/// generated route for
/// [_i1.AuthenticationScreen]
class AuthenticationRoute extends _i9.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthenticationScreen();
    },
  );
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i3.OtpScreen]
class OtpRoute extends _i9.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i10.Key? key,
    required String phoneNumber,
    required String phoneCode,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            phoneCode: phoneCode,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i3.OtpScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
        phoneCode: args.phoneCode,
      );
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.phoneCode,
  });

  final _i10.Key? key;

  final String phoneNumber;

  final String phoneCode;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNumber: $phoneNumber, phoneCode: $phoneCode}';
  }
}

/// generated route for
/// [_i4.SetupAvailabilityScreen]
class SetupAvailabilityRoute extends _i9.PageRouteInfo<void> {
  const SetupAvailabilityRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SetupAvailabilityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupAvailabilityRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.SetupAvailabilityScreen();
    },
  );
}

/// generated route for
/// [_i5.SetupBusinessDetailScreen]
class SetupBusinessDetailRoute extends _i9.PageRouteInfo<void> {
  const SetupBusinessDetailRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SetupBusinessDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupBusinessDetailRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.SetupBusinessDetailScreen();
    },
  );
}

/// generated route for
/// [_i6.SetupBusinessLocationScreen]
class SetupBusinessLocationRoute extends _i9.PageRouteInfo<void> {
  const SetupBusinessLocationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SetupBusinessLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupBusinessLocationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.SetupBusinessLocationScreen();
    },
  );
}

/// generated route for
/// [_i7.SetupBusinessProfileScreen]
class SetupBusinessProfileRoute extends _i9.PageRouteInfo<void> {
  const SetupBusinessProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SetupBusinessProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupBusinessProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SetupBusinessProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}
