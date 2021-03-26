import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductModel {
  String name;
  String price;
  int type;
  List<String> images;
  List<String> sizes;
  String description;

  ProductModel({
    this.name,
    this.price,
    this.type,
    this.images,
    this.sizes,
    this.description
  });

  ProductModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    name = doc["name"];
    price = doc["price"];
    type = doc["type"];
    images = List.from(doc["images"]);
    sizes = List.from(doc["sizes"]);
    description = doc["description"];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'type': type,
      'images': images,
      'sizes': sizes,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      price: map['price'],
      type: map['type'],
      images: List<String>.from(map['images']),
      sizes: List<String>.from(map['sizes']),
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(name: $name, price: $price, type: $type, images: $images, sizes: $sizes, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.name == name &&
      other.price == price &&
      other.type == type &&
      listEquals(other.images, images) &&
      listEquals(other.sizes, sizes) &&
      other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      type.hashCode ^
      images.hashCode ^
      sizes.hashCode ^
      description.hashCode;
  }
}
