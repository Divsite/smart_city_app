import 'package:flutter/cupertino.dart';
import 'package:smart_city_app/models/user_model.dart';


class UserProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }
}
