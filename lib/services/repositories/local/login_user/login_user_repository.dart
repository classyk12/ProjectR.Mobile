import 'package:projectr/shared/domain/models/authentication/login_model.dart';

abstract class LoginUserRepository {
  ///save login user in local storage
  Future<bool> save(UserData user);

  ///retrieve login user from locale storage
  Future<UserData?> get();

  ///remove login user from locale storage
  Future<bool> removeUser();

  //check if login user data exist
  Future<bool> isUserExist();
}
