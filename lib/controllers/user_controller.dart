import 'package:get/get.dart';
import 'package:sneakers/models/user.dart';


class UserController extends GetxController {
  var _userModel = UserModel().obs;

  UserModel get user => _userModel.value;
  set user(UserModel user) => this._userModel.value = user;

  void userClear() {
    _userModel.value = UserModel();
  }
}