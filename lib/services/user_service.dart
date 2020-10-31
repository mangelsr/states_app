import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get user => this._user;

  bool get userExist => this._user != null;

  set user(User user) {
    this._user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    this._user.age = age;
    notifyListeners();
  }

  void removeUser() {
    this._user = null;
    notifyListeners();
  }

  void addJob() {
    this._user.jobs.add('Profesrion ${_user.jobs.length + 1}');
    notifyListeners();
  }
}
