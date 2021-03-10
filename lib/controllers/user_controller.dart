import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sneakers/models/user.dart';


class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  RxBool enabled = false.obs;

  void init(){
    emailController.text = user.email;
    nameController.text = user.name;
    surnameController.text = user.surname;
    addressController.text = user.address;
    cityController.text = user.city;

  }

  UserModel get user => _userModel.value;
  set user(UserModel user) => this._userModel.value = user;

  void userClear() {
    _userModel.value = UserModel();
  }
}