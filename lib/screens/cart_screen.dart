// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_this, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/order_controller.dart';
import 'package:shopping_app/widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    var orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '  ₹${cartController.totalAmount.toInt()} ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    GetBuilder<OrderController>(
                        init: OrderController(),
                        builder: (context) {
                          return TextButton(
                              onPressed: () {
                                if (cartController.itemCount > 0) {
                                  orderController.addOrder(
                                    cartController.items.values.toList(),
                                    cartController.totalAmount,
                                  );
                                  cartController.clear();
                                  Get.snackbar(
                                      "Orders", "Orders placed successfully",
                                      backgroundColor: Colors.green[800],
                                      colorText: Colors.white,
                                      margin: EdgeInsets.all(10),
                                      snackPosition: SnackPosition.BOTTOM);
                                } else {
                                  Get.snackbar("Oops!", "Your cart is empty!",
                                      icon: Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      margin: EdgeInsets.all(10));
                                }
                              },
                              child: Text('ORDER NOW'));
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: cartController.itemCount > 0
                  ? ListView.builder(
                      itemCount: cartController.itemCount,
                      itemBuilder: (context, index) => CartItem(
                            cartController.items.values.toList()[index].id,
                            cartController.items.values.toList()[index].price,
                            cartController.items.values
                                .toList()[index]
                                .quantity,
                            cartController.items.values.toList()[index].title,
                            cartController.items.keys.toList()[index],
                            cartController.items.values
                                .toList()[index]
                                .addedToCart,
                          ))
                  : Center(
                      child: Text("Your cart is empty!",
                          style: TextStyle(fontSize: 20)),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
