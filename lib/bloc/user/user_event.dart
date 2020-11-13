part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
}

class UpdateAge extends UserEvent {
  final int age;
  UpdateAge(this.age);
}

class AddJob extends UserEvent {
  final String newJob;
  AddJob(this.newJob);
}

class DeleteUser extends UserEvent {}
