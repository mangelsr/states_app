import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

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
                userBloc.add(ActivateUser(User(
                  name: 'Miguel Sanchez',
                  age: 23,
                  jobs: ['Flutter Developer', 'Angular Developer'],
                )));
              },
            ),
            MaterialButton(
              child: Text(
                'Change age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(UpdateAge(30));
              },
            ),
            MaterialButton(
              child: Text(
                'Add job',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final int jobsCount = userBloc.state.user.jobs.length + 1;
                userBloc.add(AddJob('Job #$jobsCount'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
