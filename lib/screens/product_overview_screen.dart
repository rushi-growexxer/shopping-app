// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/badge.dart';
import 'package:shopping_app/widgets/productgrid.dart';

enum FilterOptions {
  FAVOURITES,
  ALL,
}

class ProductOverviewPage extends StatelessWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _showOnlyFavourites = false;
    final controller = Get.put(ProductController());
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Omazon Shopping App"),
        centerTitle: true,
        actions: <Widget>[
          GetBuilder<CartController>(
              init: CartController(),
              builder: (contex) {
                return Badge(
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {
                        Get.to(() => CartScreen());
                      }),
                  value: cartController.itemCount.toString(),
                  color: Colors.white,
                );
              })
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
