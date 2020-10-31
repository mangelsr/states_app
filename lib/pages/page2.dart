import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
          title: userService.userExist
              ? Text('${userService.user.name}')
              : Text('Page 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Stablish user',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => userService.user =
                  User(name: 'Miguel Sanchez', age: 23, jobs: [
                'Flutter developer',
                'FullStack developer',
              ]),
            ),
            RaisedButton(
              child: Text('Change age'),
              onPressed: userService.userExist
                  ? () => userService.changeAge(27)
                  : null,
            ),
            MaterialButton(
              child: Text(
                'Add job',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => userService.addJob(),
            ),
          ],
        ),
      ),
    );
  }
}
