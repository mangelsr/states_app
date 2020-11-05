part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final userExist = false;
}

class UserActive extends UserState {
  final User user;
  UserActive(this.user);
}
