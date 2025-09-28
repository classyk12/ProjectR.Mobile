import 'package:projectr/shared/domain/models/authentication/auth_models.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, LoginResponseModel>> withSocial({
    required int type,
    required String token,
    required String email,
  });

  Future<Either<AppException, PhoneNumberLoginResponseModel>> withPhoneNumber(
      {required String phoneCode, required String phoneNumber});

  Future<Either<AppException, LoginResponseModel>> completePhoneNumberLogin(
      {required CompleteLoginWithPhoneNumberModel model});
}
