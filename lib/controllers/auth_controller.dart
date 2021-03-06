import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/models/user.dart';
import 'package:sneakers/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var _firebaseUser = Rx<User>();
  User get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password, String surname,
      String address, String city) async {
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
        print("git");
        Get.find<UserController>().user = _user;
      } else {
        print("Nie zapisano");
      }
    } catch (e) {
      Get.snackbar(
        "Error creating account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logIn(String email, String password) async {
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
}
