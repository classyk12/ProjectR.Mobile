import 'package:projectr/shared/data/local/storage_service.dart';
import 'package:projectr/shared/domain/models/authentication/login_model.dart';

abstract class LoginUserDataSource {
  String get storageKey;

  Future<UserData?> fetchUser();
  Future<bool> saveUser(UserData user);
  Future<bool> removeUser();
  Future<bool> hasUser();
}

class LoginUserDataSourceImpl extends LoginUserDataSource {
  LoginUserDataSourceImpl(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => '';

  @override
  Future<UserData?> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data != null && data != '') {
      final userJson = data.toString();
      return UserData.fromJson(userJson);
    }
    return null;
  }

  @override
  Future<bool> saveUser(UserData user) async {
    return await storageService.set(storageKey, user.toJson());
  }

  @override
  Future<bool> removeUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}
