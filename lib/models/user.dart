import 'package:meta/meta.dart';

class User {
  String name;
  int age;
  List<String> jobs;

  User({@required this.name, this.age, this.jobs}) : assert(name != null);
}
