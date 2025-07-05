import 'package:projectr/shared/domain/models/authentication/check_user_model.dart';
import 'package:projectr/shared/domain/models/authentication/login_model.dart';
import 'package:projectr/shared/domain/models/base_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, LoginResponseModel>> login(
      {required String userName, required String password});

  Future<Either<AppException, bool>> forgotPasssword({required String custId});

  Future<Either<AppException, List<UserAccountsModel>>> getUserAccounts(
      {required String userName});

  Future<Either<AppException, bool>> resetPassword(
      {required String custId, required String otp, required String password});

  Future<Either<AppException, BaseModel>> verifyEmail({required String email});

  Future<Either<AppException, BaseModel>> createAccount(
      {required Map<String, dynamic> model});
}
