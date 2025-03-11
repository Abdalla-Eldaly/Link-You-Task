import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/user_model.dart';

@lazySingleton
class UserProvider extends ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  bool get isLoggedIn => _user != null;

  void login(String token) {
    _token = token;
    notifyListeners();
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }


}
