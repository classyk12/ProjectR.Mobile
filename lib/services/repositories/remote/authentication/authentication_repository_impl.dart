import 'package:projectr/services/api_services/authentication/authentication_service.dart';
import 'package:projectr/services/repositories/remote/authentication/auth_repository.dart';
import 'package:projectr/shared/domain/models/authentication/check_user_model.dart';
import 'package:projectr/shared/domain/models/authentication/login_model.dart';
import 'package:projectr/shared/domain/models/base_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final IAuthService dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, LoginResponseModel>> login(
      {required String userName, required String password}) async {
    return dataSource.login(userName: userName, password: password);
  }

  @override
  Future<Either<AppException, bool>> forgotPasssword({required String custId}) {
    return dataSource.forgotPassword(custId: custId);
  }

  @override
  Future<Either<AppException, List<UserAccountsModel>>> getUserAccounts(
      {required String userName}) {
    return dataSource.getUserAccount(userName: userName);
  }

  @override
  Future<Either<AppException, bool>> resetPassword({
    required String custId,
    required String otp,
    required String password,
  }) async {
    return dataSource.resetPassword(
        custId: custId, password: password, otp: otp);
  }

  @override
  Future<Either<AppException, BaseModel>> verifyEmail(
      {required String email}) async {
    return dataSource.verifyEmail(email: email);
  }

  @override
  Future<Either<AppException, BaseModel>> createAccount(
      {required Map<String, dynamic> model}) {
    return dataSource.createAccount(model: model);
  }
}
