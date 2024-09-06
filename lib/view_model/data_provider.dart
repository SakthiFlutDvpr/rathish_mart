import 'package:flutter/material.dart';
import 'package:pro_three/models/data_model.dart';

class DataProvider extends ChangeNotifier {
  Product? product;

  List<Product> cartProducts = [];
  bool added = false;

  DataProvider(this.product);

  addToCart() {
    if (added != true) {
      product!.value = 1;
      cartProducts.add(product!);
      added = true;
    }

    notifyListeners();
  }
}
