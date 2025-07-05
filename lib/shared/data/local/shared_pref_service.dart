import 'dart:async';
import 'package:projectr/shared/data/local/storage_service.dart';
import 'package:projectr/shared/helpers/encryption_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements StorageService {
  SharedPreferences? sharedPreferences;
  final IEncryptionHelper encryptionHelper;

  final Completer<SharedPreferences> initCompleter =
      Completer<SharedPreferences>();

  SharedPrefsService({required this.encryptionHelper});

  @override
  void init() {
    initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    sharedPreferences = await initCompleter.future;
    var result = sharedPreferences!.get(key);
    if (result == null) {
      return '';
    }
    var decrypt = encryptionHelper.decryptData(result.toString());
    return decrypt;
  }

  @override
  Future<void> clear() async {
    sharedPreferences = await initCompleter.future;
    await sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key) async {
    sharedPreferences = await initCompleter.future;
    var containsKey = sharedPreferences?.containsKey(key) ?? false;
    return containsKey;
  }

  @override
  Future<bool> remove(String key) async {
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.remove(key);
  }

  @override
  Future<bool> set(String key, data) async {
    if (data != null) {
      sharedPreferences = await initCompleter.future;
      //encrypt data
      var encrypt = encryptionHelper.encryptData(data);
      return await sharedPreferences!.setString(key, encrypt);
    }

    return false;
  }
}
