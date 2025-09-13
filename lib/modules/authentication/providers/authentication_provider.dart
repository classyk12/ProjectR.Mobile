import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/providers/auth_provider.dart';
import 'package:projectr/shared/domain/models/authentication/auth_models.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/enums.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

final isPasswordProvider = StateProvider<bool>((ref) => true);
final shouldListenToProvider = StateProvider.autoDispose<bool>((ref) => false);
final shouldListenToOtpProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final shouldListenToGoogleAuthProvider =
    StateProvider.autoDispose<bool>((ref) => false);
CompleteLoginWithPhoneNumberModel? completeLoginWithPhoneNumberModel;

String phoneCode = '';
String phoneNumber = '';

String googleAuthToken = '';
String email = '';
const SocialLoginType socialLoginType = SocialLoginType.google;

final phoneNumberLoginProvider = FutureProvider.autoDispose<
    Either<AppException, PhoneNumberLoginResponseModel>>((ref) async {
  if (ref.watch(shouldListenToProvider) == true) {
    var authRepo = ref.watch(authRepositoryProvider);
    return await authRepo.withPhoneNumber(
        phoneCode: phoneCode, phoneNumber: phoneNumber);
  }

  return Right(PhoneNumberLoginResponseModel());
});

final completePhoneNumberLoginProvider =
    FutureProvider.autoDispose<Either<AppException, LoginResponseModel>>(
        (ref) async {
  if (ref.watch(shouldListenToOtpProvider) == true) {
    try {
      var authRepo = ref.watch(authRepositoryProvider);
      return authRepo.completePhoneNumberLogin(
          model: completeLoginWithPhoneNumberModel!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  return Right(LoginResponseModel());
});

final socialLogin =
    FutureProvider.autoDispose<Either<AppException, LoginResponseModel>>(
        (ref) async {
  if (ref.watch(shouldListenToGoogleAuthProvider) == true) {
    var authRepo = ref.watch(authRepositoryProvider);
    return authRepo.withSocial(
        type: socialLoginType.index + 1, token: googleAuthToken, email: email);
  }

  return Right(LoginResponseModel());
});
