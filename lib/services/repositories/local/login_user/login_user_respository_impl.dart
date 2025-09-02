import 'package:projectr/services/repositories/local/login_user/local_user_repository_data_source.dart';
import 'package:projectr/services/repositories/local/login_user/login_user_repository.dart';
import 'package:projectr/shared/domain/models/authentication/auth_models.dart';

class LoginUserRepositoryImpl extends LoginUserRepository {
  final LoginUserDataSource _service;

  LoginUserRepositoryImpl(this._service);

  @override
  Future<LoggedInUser?> get() async {
    var data = await _service.fetchUser();
    return data;
  }

  @override
  Future<bool> save(LoggedInUser user) async {
    return await _service.saveUser(user);
  }

  @override
  Future<bool> isUserExist() async {
    return await _service.hasUser();
  }

  @override
  Future<bool> removeUser() async {
    return await _service.removeUser();
  }
}
