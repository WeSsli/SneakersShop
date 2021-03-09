import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String name;
  String price;
  int type;
  List<String> images;
  List<String> sizes;

  ProductModel({
    this.name,
    this.price,
    this.type,
    this.images,
    this.sizes,
  });

  ProductModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    name = doc["name"];
    price = doc["price"];
    type = doc["type"];
    images = List.from(doc["images"]);
    sizes = List.from(doc["sizes"]);
  }
}
