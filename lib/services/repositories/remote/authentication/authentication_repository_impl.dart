import 'package:projectr/services/api_services/authentication/authentication_service.dart';
import 'package:projectr/services/repositories/remote/authentication/auth_repository.dart';
import 'package:projectr/shared/domain/models/authentication/auth_models.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final IAuthService _service;

  AuthenticationRepositoryImpl(this._service);

  @override
  Future<Either<AppException, LoginResponseModel>> completePhoneNumberLogin(
      {required CompleteLoginWithPhoneNumberModel model}) async {
    return await _service.completePhoneNumberLogin(model: model);
  }

  @override
  Future<Either<AppException, PhoneNumberLoginResponseModel>> withPhoneNumber(
      {required String phoneCode, required String phoneNumber}) async {
    return await _service.withPhoneNumber(
        phoneCode: phoneCode, phoneNumber: phoneNumber);
  }

  @override
  Future<Either<AppException, LoginResponseModel>> withSocial(
      {required int type, required String token, required String email}) async {
    return await _service.withSocial(type: type, token: token, email: email);
  }
}
