import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/models/user.dart';
import 'package:sneakers/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  PageController deleteDialogController =
      PageController(initialPage: 0, keepPage: true);
  var dialogIndex = 0.obs;
  final TextEditingController dialogEmailController = TextEditingController();
  final TextEditingController dialogPasswordController =
      TextEditingController();

  void init() {
    Get.find<FirebaseAuth>().authStateChanges().listen((event) async {
      if (event != null) {
        Get.find<UserController>().user = await Database().getUser(event.uid);
        Get.offNamed("home");
      } else {
        Get.offNamed("login");
      }
    });
  }

  Future<void> createUser(String name, String email, String password,
      String surname, String address, String city) async {
    try {
      //Create user in auth
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      UserModel _user = UserModel(
        id: _authResult.user.uid,
        email: _authResult.user.email,
        name: name,
        surname: surname,
        address: address,
        city: city,
      );

      //Create user in firestore
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
      } else {
        throw ("Nie dodano użytkownika do bazy");
      }
    } catch (e) {
      Get.snackbar(
        "Error creating account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> logIn(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar('Error while loging in', e.message);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().userClear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //TODO usunac usera z firestore
  void deleteUser() async {
    EmailAuthCredential credential = EmailAuthProvider.credential(
        email: dialogEmailController.text,
        password: dialogPasswordController.text);
    await _auth.currentUser.reauthenticateWithCredential(credential);
    _auth.currentUser.delete();
    dialogEmailController.clear();
    dialogPasswordController.clear();
    Get.find<UserController>().userClear();
  }

  Future setPage(int index) async {
    if (deleteDialogController != null) {
      await deleteDialogController.animateToPage(
        index,
        duration: Duration(milliseconds: 375),
        curve: Curves.easeInOut,
      );

      dialogIndex.value = index;
    }
  }
}
