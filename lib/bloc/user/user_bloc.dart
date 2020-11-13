import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is ActivateUser) {
      yield state.copyWith(user: event.user);
    } else if (event is UpdateAge) {
      yield state.copyWith(user: state.user.copyWith(age: event.age));
    } else if (event is AddJob) {
      yield state.copyWith(
          user: state.user.copyWith(
        jobs: [...state.user.jobs, event.newJob],
      ));
    } else if (event is DeleteUser) {
      yield state.initialState();
    } else {
      yield UserState();
    }
  }
}
