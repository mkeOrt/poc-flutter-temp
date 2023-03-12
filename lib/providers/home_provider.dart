import 'package:corazon_de_nino/models/product_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    whereIsDataBase();
  }

  String databasePath = 'dfsgfds';

  final List<ProductCart> cart = [
    ProductCart(
      id: 1,
      name: 'Blusa',
      price: 200,
      quantity: 23,
      amount: 2,
    ),
    ProductCart(
      id: 2,
      name: 'Pantalon',
      price: 199.99,
      quantity: 13,
      amount: 1,
    ),
    ProductCart(
      id: 3,
      name: 'Short',
      price: 76,
      quantity: 41,
      amount: 2,
    ),
  ];

  double get total {
    return cart.fold(
      0.0,
      (previousValue, element) =>
          previousValue.toDouble() + element.amount.toDouble() * element.price,
    );
  }

  void deleteProduct(ProductCart product) {
    cart.remove(product);
    notifyListeners();
  }

  void whereIsDataBase() async {
    sqfliteFfiInit();
    databasePath = inMemoryDatabasePath;
  }
}
