import 'package:projectr/shared/domain/models/authentication/auth_models.dart';

abstract class LoginUserRepository {
  ///save login user in local storage
  Future<bool> save(LoggedInUser user);

  ///retrieve login user from locale storage
  Future<LoggedInUser?> get();

  ///remove login user from locale storage
  Future<bool> removeUser();

  //check if login user data exist
  Future<bool> isUserExist();
}
