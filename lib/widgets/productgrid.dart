// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_this, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/product_details_screen.dart';
import 'package:shopping_app/widgets/badge.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavourites;

  ProductsGrid(
    this.showFavourites,
  );
  final controller = Get.put(ProductController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: controller.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 3 / 2, mainAxisSpacing: 30),
      itemBuilder: (context, index) {
        return GetBuilder(
          init: ProductController(),
          builder: (value) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    ProductDetailsScreen(
                      controller.items[index].title,
                      controller.items[index].price,
                      controller.items[index].imageUrl,
                      controller.items[index].description,
                    ),
                  );
                },
                child: Image.network(
                  controller.items[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: Icon(
                    controller.items[index].isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    controller.toggleFavouriteStatus(index);
                  },
                ),
                title: Text(
                  '${controller.items[index].title} | Rs. ${controller.items[index].price.toInt()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return Row(
                        children: [
                          cartController.addedToCart(controller.items[index].id)
                              ? Badge(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    onPressed: () {
                                      cartController.addItem(
                                          controller.items[index].id,
                                          controller.items[index].price,
                                          controller.items[index].title,
                                          true,
                                          1);
                                    },
                                  ),
                                  value: cartController
                                      .getItemCountInCart(
                                          controller.items[index].id)
                                      .toString(),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  onPressed: () {
                                    cartController.addItem(
                                        controller.items[index].id,
                                        controller.items[index].price,
                                        controller.items[index].title,
                                        true,
                                        1);
                                  },
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                        ],
                      );
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
