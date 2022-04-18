// ignore_for_file: prefer_const_constructors

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/cart_item.dart';

class CartController extends GetxController {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(int productId, double price, String title, bool addedToCart,
      int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + quantity,
              addedToCart: existingCartItem.addedToCart,
              price: existingCartItem.price));

      update();
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          addedToCart: true,
        ),
      );
    }
    Get.snackbar(
      'Item Added to cart',
      '$title has been added to cart. | Quantity: ${_items[productId]?.quantity}',
      backgroundColor: Colors.purple,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(milliseconds: 1500),
    );
    update();
  }

  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  // get addedToCart by id
  bool addedToCart(int productId) {
    return _items[productId]?.addedToCart ?? false;
  }

  void clear() {
    _items = {};
    // // set addedToCart to false for all items
    // _items.forEach((key, cartItem) {
    //   cartItem. = false;
    // });
    update();
  }

  int getItemCountInCart(int productId) {
    return _items[productId]?.quantity ?? 0;
  }
}
