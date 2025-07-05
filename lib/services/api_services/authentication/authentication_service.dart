import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/authentication/check_user_model.dart';
import 'package:projectr/shared/domain/models/authentication/login_model.dart';
import 'package:projectr/shared/domain/models/base_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:dio/dio.dart';

abstract class IAuthService {
  Future<Either<AppException, LoginResponseModel>> login(
      {required String userName, required String password});

  Future<Either<AppException, bool>> forgotPassword({required String custId});

  Future<Either<AppException, List<UserAccountsModel>>> getUserAccount(
      {required String userName});

  Future<Either<AppException, bool>> resetPassword(
      {required String custId, required String password, required String otp});

  Future<Either<AppException, BaseModel>> verifyEmail({required String email});
  Future<Either<AppException, BaseModel>> createAccount(
      {required Map<String, dynamic> model});
}

class AuthService implements IAuthService {
  final NetworkService networkService;

  AuthService(this.networkService);

  @override
  Future<Either<AppException, LoginResponseModel>> login(
      {required String userName, required String password}) async {
    try {
      final eitherType = await networkService.post(
        'auth/login',
        data: {'username': userName, 'password': password},
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

  @override
  Future<Either<AppException, bool>> forgotPassword(
      {required String custId}) async {
    try {
      final eitherType = await networkService.post(
        'auth/forgetPassword',
        data: {'CustID': custId},
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while resetting password.',
            ),
          );
        },
        (response) {
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(message: 'Unknown error occurred', error: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppException, List<UserAccountsModel>>> getUserAccount(
      {required String userName}) async {
    try {
      final eitherType = await networkService.get(
        'users/usernames?email=$userName',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while resetting password.',
            ),
          );
        },
        (response) {
          final userAccounts = List<UserAccountsModel>.from(
              response.data['data'].map((x) => UserAccountsModel.fromMap(x)));
          return Right(userAccounts);
        },
      );
    } catch (e) {
      return Left(
        AppException(message: 'Unknown error occurred', error: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> resetPassword({
    required String custId,
    required String password,
    required String otp,
  }) async {
    try {
      final eitherType = await networkService.post(
        'auth/resetPassword',
        data: {'CustID': custId, 'otp': otp, 'password': password},
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse(
              data: exception.message,
              message: exception.error,
              statusCode: 400);
          return Left(
            AppException(
              error: result.data,
              message: result.message ??
                  'Unknown error occurred while resetting password.',
            ),
          );
        },
        (response) {
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(message: 'Unknown error occurred', error: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppException, BaseModel>> verifyEmail(
      {required String email}) async {
    try {
      final eitherType = await networkService.post(
        'auth/verify-email',
        data: {'email': email},
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse(
              data: exception.message,
              message: exception.error,
              statusCode: 400);
          return Left(
            AppException(
              error: result.data,
              message: result.message ??
                  'Unknown error occurred while verifying email.',
            ),
          );
        },
        (response) {
          var res = response.data['data'];
          return Right(BaseModel(
              message: res == true
                  ? 'You already have an account with us registered to this email. Please Login.'
                  : '',
              status: !res));
        },
      );
    } catch (e) {
      return Left(
        AppException(
            message: 'Unknown error occurred while verifying email.',
            error: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppException, BaseModel>> createAccount(
      {required Map<String, dynamic> model}) async {
    try {
      final eitherType = await networkService.postObject(
        'auth/signup',
        data: FormData.fromMap(model),
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse(
              data: exception.message,
              message: exception.error,
              statusCode: 400);
          return Left(
            AppException(
              error: result.data,
              message: result.message ??
                  'Unknown error occurred while creating account.',
            ),
          );
        },
        (response) {
          return Right(BaseModel(
              status: response.statusCode == 200,
              message: response.message ?? 'Account Created Successfully'));
        },
      );
    } catch (e) {
      return Left(
        AppException(
            message: 'Unknown error occurred while creating account',
            error: e.toString()),
      );
    }
  }
}
