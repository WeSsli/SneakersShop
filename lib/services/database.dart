import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/models/product.dart';
import 'package:sneakers/models/user.dart';
import 'package:sneakers/screens/cart_screen/controllers/cart_controller.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserController userController = Get.find<UserController>();
  final CartController cartController = Get.find<CartController>();

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "email": user.email,
        "name": user.name,
        "surname": user.surname,
        "address": user.address,
        "city": user.city
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      return UserModel();
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      List<ProductModel> tempProducts = List();
      QuerySnapshot querySnapshot =
          await _firestore.collection("products").get();
      querySnapshot.docs.forEach((element) {
        tempProducts.add(ProductModel.fromDocumentSnapshot(element));
      });

      return tempProducts;
    } catch (e) {
      print(e);
      return List<ProductModel>();
    }
  }

  Future<void> updateUser(String uid) async {
    await _firestore.collection("users").doc(uid).update({
      "name": userController.nameController.text,
      "surname": userController.surnameController.text,
      "address": userController.addressController.text,
      "city": userController.cityController.text
    });
  }

  Future<bool> deleteUser(String uid) async {
    CollectionReference users = _firestore.collection('users');
    try {
      users.doc(uid).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> order() async {
    try {
      if (cartController.cartList.value.isNotEmpty) {
        await _firestore.collection("orders").add({
          "cart": cartController.cartList.value.map((e) => e.toMap()).toList(),
          "date": DateTime.now(),
          "customer": userController.user.id,
          "price": cartController.sumPrice.value,
        });
        return true;
      } else {
        throw ("Lista jest pusta");
      }
    } catch (e) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          message: "Nie udało się wysłać zamówienia",
          snackPosition: SnackPosition.BOTTOM);
      print(e);
      return false;
    }
  }

/*
  listenProducts() {
    List<ProductModel> tempProducts = List();
    Stream<QuerySnapshot> stream =
        _firestore.collection("products").snapshots();
    stream.listen((querySnapshot) {
      tempProducts.clear();
      querySnapshot.docs.forEach((element) {
        tempProducts.add(ProductModel.fromDocumentSnapshot(element));
      });
      Get.find<ProductController>().products.assignAll(tempProducts);
      Get.find<ProductController>().update(["list"]);
    });
    */
}
