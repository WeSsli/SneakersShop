import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String email;
  String name;
  String surname;
  String address;
  String city;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.surname,
    this.address,
    this.city,
  });

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    email = doc["email"];
    name = doc["name"];
    surname = doc["surname"];
    address = doc["address"];
    city = doc["city"];
  }
}