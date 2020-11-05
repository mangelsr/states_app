class User {
  final String name;
  final int age;
  final List<String> jobs;

  User({this.name, this.age, this.jobs});

  User copyWith({String name, int age, List<String> jobs}) => User(
      name: name ?? this.name, age: age ?? this.age, jobs: jobs ?? this.jobs);
}
