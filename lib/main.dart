import 'package:flutter/material.dart';
import 'package:states_app/pages/page1.dart';
import 'package:states_app/pages/page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'page1',
        routes: {
          'page1': (BuildContext _) => Page1(),
          'page2': (BuildContext _) => Page2(),
        });
  }
}
