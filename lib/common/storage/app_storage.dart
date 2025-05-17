import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage<T> {
  static FlutterSecureStorage? _instance;

  AppStorage._();

  static FlutterSecureStorage get instance =>
      _instance ??= const FlutterSecureStorage();

  static void deleteData() {
    for (final item in SecurePreferencesKeys.logoutKeys) {
      AppStorage.instance.delete(key: item);
    }
  }

  static Future<void> setData({
    required String key,
    String? data,
  }) async {
    await AppStorage.instance.write(
      key: key,
      value: data,
    );
  }

  static Future<String> getData({
    required String key,
  }) async {
    final secureData = await AppStorage.instance.read(
      key: key,
    );
    return secureData ?? '';
  }
}

class SecurePreferencesKeys {
  static String accessToken = 'accessToken';
  static String branchId = 'branchId';

  static List<String> get logoutKeys {
    return <String>[
      accessToken,
      branchId,
    ];
  }
}
