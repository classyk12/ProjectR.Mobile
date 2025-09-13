import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/authentication/auth_models.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class IAuthService {
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

class AuthService implements IAuthService {
  final NetworkService networkService;
  final String path = 'Authentications/';

  AuthService(this.networkService);

  @override
  Future<Either<AppException, PhoneNumberLoginResponseModel>> withPhoneNumber(
      {required String phoneCode, required String phoneNumber}) async {
    try {
      final eitherType = await networkService.post(
        '$path/WithPhoneNumber',
        data: {
          'phoneCode': phoneCode,
          'phoneNumber': phoneNumber,
        },
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          var data = response.data;
          var res = PhoneNumberLoginResponseModel.fromMap(data['data']);
          return Right(res);
        },
      );
    } catch (e) {
      return Left(
        AppException(message: 'Unknown error occurred', error: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppException, LoginResponseModel>> completePhoneNumberLogin(
      {required CompleteLoginWithPhoneNumberModel model}) async {
    try {
      final eitherType = await networkService.post(
        '$path/CompletePhoneNumberLogin',
        data: model.toMap(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          var data = response.data;
          var login = LoginResponseModel.fromMap(data['data']);
          return Right(login);
        },
      );
    } catch (e) {
      return Left(
        AppException(message: 'Unknown error occurred', error: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppException, LoginResponseModel>> withSocial(
      {required int type, required String token, required String email}) async {
    try {
      final eitherType = await networkService.post(
        '$path/CompletePhoneNumberLogin',
        data: {
          'type': type,
          'token': token,
          'email': email,
        },
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          var data = response.data;
          var login = LoginResponseModel.fromMap(data);
          return Right(login);
        },
      );
    } catch (e) {
      return Left(
        AppException(message: 'Unknown error occurred', error: e.toString()),
      );
    }
  }
}
