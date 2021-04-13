import 'package:get/get.dart';

import 'package:states_app/models/user.dart';

class UserController extends GetxController {
  RxBool userExist = false.obs;
  Rx<User> user = User().obs;

  int get jobsCount => this.user.value.jobs.length;

  loadUser(User user) {
    this.userExist.value = true;
    this.user.value = user;
  }

  changeAge(age) {
    this.user.update((User? val) => val!.age = age);
  }

  addJob(String job) {
    this.user.update((User? val) => val!.jobs = [...val.jobs, job]);
  }
}
