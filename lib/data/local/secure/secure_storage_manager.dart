import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorageManager {
  static FlutterSecureStorage secureStorage = Get.find<FlutterSecureStorage>();
  final String _tokenKey = "token";

  // Token
  //
  Future<String?> getToken() async {
    return secureStorage.read(key: _tokenKey);
  }

  Future<void> setToken({String? value}) async {
    return secureStorage.write(key: _tokenKey, value: value);
  }
}
