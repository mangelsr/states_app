import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_cubit.dart';
import 'package:states_app/models/user.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.bloc<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => userCubit.deleteUser(),
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
        builder: (BuildContext _, UserState state) {
      // Metodo de if anidado
      // if (state is UserInitial) {
      //   return Center(child: Text('No user info'));
      // } else if (state is UserActive) {
      //   return UserInfo(state.user);
      // } else {
      //   return Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }

      // Metodo con switch
      switch (state.runtimeType) {
        case UserInitial:
          return Center(child: Text('No user info'));

        case UserActive:
          return UserInfo((state as UserActive).user); //Casteo seguro necesario

        default:
          return Center(child: CircularProgressIndicator());
      }
    });
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
            itemBuilder: (BuildContext _, int index) =>
                ListTile(title: Text('Job ${index + 1}: ${user.jobs[index]}')),
          ),
        ],
      ),
    );
  }
}
