import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_app/consts/app_constant.dart';

class SharedPref {
  late SharedPreferences sharedPreferences;

  SharedPref(SharedPreferences shared) {
    sharedPreferences = shared;
  }

  Future<void> setToken(String token) async {
    try {
      await sharedPreferences.setString(AppConstant.token, token);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getToken() async {
    try {
      String? token = sharedPreferences.getString(AppConstant.token);

      return token;
    } catch (e) {
      return null;
    }
  }

  Future<void> clear() async {
    try {
      sharedPreferences.clear();
    } catch (e) {
      rethrow;
    }
  }
}