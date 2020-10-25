import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: UserInfo(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
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
          ListTile(title: Text('Name: ')),
          ListTile(title: Text('Age: ')),
          Text('Jobds',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          ListTile(title: Text('Job1: ')),
          ListTile(title: Text('Job2: ')),
        ],
      ),
    );
  }
}
