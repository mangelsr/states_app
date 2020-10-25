import 'dart:async';

import 'package:states_app/models/user.dart';

class _UserService {
  User _user;

  StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  Stream<User> get userStream => _userStreamController.stream;

  User get user => this._user;

  bool get userExist => this._user != null;

  void loadUser(User user) {
    this._user = user;
    this._userStreamController.add(this._user);
  }

  void setAge(int age) {
    this._user.age = age;
    this._userStreamController.add(this._user);
  }

  dispose() {
    this._userStreamController?.close();
  }
}

final userService = new _UserService();
