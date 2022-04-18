// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_this, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/order_controller.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  var orderController = Get.put(OrderController());

  OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yours Orders"),
        ),
        drawer: AppDrawer(),
        body: orderController.orders.isNotEmpty
            ? ListView.builder(
                itemCount: orderController.orders.length,
                itemBuilder: (context, index) =>
                    OrderItem(orderController.orders[index]))
            : Center(
                child: Text("No Orders Yet!"),
              ));
  }
}
