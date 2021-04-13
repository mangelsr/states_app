import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:states_app/controllers/user_controller.dart';
import 'package:states_app/models/user.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
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
                onPressed: () {
                  userCtrl.loadUser(
                    User(
                      name: 'Miguel',
                      age: 24,
                      jobs: ['FullStack Dev', 'WebDev', 'IT Technitian'],
                    ),
                  );
                  Get.snackbar('System message', 'User setted',
                      backgroundColor: Colors.white,
                      boxShadows: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10,
                        )
                      ]);
                }),
            MaterialButton(
              child: Text(
                'Change age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => userCtrl.changeAge(22),
            ),
            MaterialButton(
              child: Text(
                'Add job',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => userCtrl.addJob('Job #${userCtrl.jobsCount}'),
            ),
            MaterialButton(
              child: Text(
                'Change Theme',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
            ),
          ],
        ),
      ),
    );
  }
}
