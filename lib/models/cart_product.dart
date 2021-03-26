import 'package:sneakers/models/product.dart';

class ProductCartModel {
  ProductModel product;
  int quantity;
  String size;

  ProductCartModel({
    this.product,
    this.quantity,
    this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
      'size': size,
    };
  }
}
