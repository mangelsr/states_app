import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(DeleteUser());
            },
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
          builder: (_, UserState state) => state.userExist
              ? UserInfo(state.user)
              : Center(
                  child: Text('No user selected'),
                )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo(this.user);

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
          ListTile(title: Text('Name: ${user.name}')),
          ListTile(title: Text('Age: ${user.age}')),
          Text('Jobs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          ListView.builder(
            shrinkWrap: true,
            itemCount: user.jobs.length,
            itemBuilder: (_, int index) =>
                ListTile(title: Text('Job ${index + 1}: ${user.jobs[index]}')),
          ),
        ],
      ),
    );
  }
}
