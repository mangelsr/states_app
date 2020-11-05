import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void setUser(User user) {
    emit(UserActive(user));
  }

  void setAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      final newUser = currentState.user.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addJob() {
    final currentState = state;
    if (currentState is UserActive) {
      final newJobs = [...currentState.user.jobs];
      newJobs.add('Job #${newJobs.length + 1}');
      final newUser = currentState.user.copyWith(jobs: newJobs);
      emit(UserActive(newUser));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }
}
