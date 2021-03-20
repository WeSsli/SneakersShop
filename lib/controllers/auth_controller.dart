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
  final database = Database();

  void init() {
    Get.find<FirebaseAuth>().authStateChanges().listen((event) async {
      if (event != null) {
        Get.find<UserController>().user = await database.getUser(event.uid);
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
      if (await database.createNewUser(_user)) {
        Get.find<UserController>().user = _user;
      } else {
        throw ("Nie dodano użytkownika do bazy");
      }
    } catch (e) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          title: "Nie udało się utworzyć konta",
          message: e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logIn(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await database.getUser(_authResult.user.uid);
    } catch (e) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          title: "Nie udało się zalogować",
          message: e.message,
          snackPosition: SnackPosition.BOTTOM);
      print(e.message);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().userClear();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          message: "Wylogowano",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          message: e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void deleteUser() async {
    EmailAuthCredential credential = EmailAuthProvider.credential(
        email: dialogEmailController.text,
        password: dialogPasswordController.text);
    try {
      await _auth.currentUser
          .reauthenticateWithCredential(credential)
          .then((value) async {
        if (await database.deleteUser(_auth.currentUser.uid)) {
          await _auth.currentUser.delete();

          Get.rawSnackbar(
            backgroundColor: Colors.green,
            message: "Konto zostało usunięte",
            snackPosition: SnackPosition.BOTTOM,
          );

          dialogEmailController.clear();
          dialogPasswordController.clear();
          Get.find<UserController>().userClear();

          init();
        } else {
          Get.rawSnackbar(
              backgroundColor: Colors.red,
              message: "Nie udało się usunąć konta",
              snackPosition: SnackPosition.BOTTOM);
        }
      });
    } catch (e) {
      dialogEmailController.clear();
      dialogPasswordController.clear();
      Get.find<UserController>().userClear();
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          message: "Nastąpiło wylogowanie",
          title: "Podane dane są niepoprawne",
          snackPosition: SnackPosition.BOTTOM);
    }
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
