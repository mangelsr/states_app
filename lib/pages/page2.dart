import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_cubit.dart';
import 'package:states_app/models/user.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.bloc<UserCubit>();
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
                var user = User(
                    name: 'Miguel Sanchez',
                    age: 23,
                    jobs: ['Flutter developer']);
                userCubit.setUser(user);
              },
            ),
            MaterialButton(
              child: Text(
                'Change age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userCubit.setAge(25);
              },
            ),
            MaterialButton(
              child: Text(
                'Add job',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userCubit.addJob();
              },
            ),
          ],
        ),
      ),
    );
  }
}
