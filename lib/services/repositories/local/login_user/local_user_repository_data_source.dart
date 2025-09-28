import 'package:projectr/shared/data/local/storage_service.dart';
import 'package:projectr/shared/domain/models/authentication/auth_models.dart';

abstract class LoginUserDataSource {
  String get storageKey;

  Future<LoggedInUser?> fetchUser();
  Future<bool> saveUser(LoggedInUser user);
  Future<bool> removeUser();
  Future<bool> hasUser();
}

class LoginUserDataSourceImpl extends LoginUserDataSource {
  LoginUserDataSourceImpl(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => '';

  @override
  Future<LoggedInUser?> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data != null && data != '') {
      final userJson = data.toString();
      return LoggedInUser.fromMap({});
    }
    return null;
  }

  @override
  Future<bool> saveUser(LoggedInUser user) async {
    return await storageService.set(storageKey, '${user.toMap()}');
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
