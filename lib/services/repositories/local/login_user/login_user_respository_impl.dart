import 'package:projectr/services/repositories/local/login_user/local_user_repository_data_source.dart';
import 'package:projectr/services/repositories/local/login_user/login_user_repository.dart';
import 'package:projectr/shared/domain/models/authentication/login_model.dart';

class LoginUserRepositoryImpl extends LoginUserRepository {
  final LoginUserDataSource dataSource;

  LoginUserRepositoryImpl(this.dataSource);

  @override
  Future<UserData?> get() async {
    var data = await dataSource.fetchUser();
    return data;
  }

  @override
  Future<bool> save(UserData user) async {
    return await dataSource.saveUser(user);
  }

  @override
  Future<bool> isUserExist() async {
    return await dataSource.hasUser();
  }

  @override
  Future<bool> removeUser() async {
    return await dataSource.removeUser();
  }
}
