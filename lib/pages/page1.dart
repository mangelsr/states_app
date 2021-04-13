import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:states_app/controllers/user_controller.dart';
import 'package:states_app/models/user.dart';

// import 'package:states_app/pages/page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Obx(() => userCtrl.userExist.value
          ? UserInfo(user: userCtrl.user.value)
          : NoInfo()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        // onPressed: () => Navigator.pushNamed(context, 'page2'),
        onPressed: () => Get.toNamed(
          'page2',
          arguments: {'name': 'Miguel', 'age': 23},
        ),
        // onPressed: () => Get.to(Page2()),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No info selected'),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          Divider(),
          ListTile(title: Text('Name: ${this.user.name}')),
          ListTile(title: Text('Age: ${this.user.age}')),
          Text('Jobs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          ListView.builder(
            shrinkWrap: true,
            itemCount: user.jobs.length,
            itemBuilder: (_, i) => ListTile(title: Text(user.jobs[i])),
          ),
        ],
      ),
    );
  }
}
