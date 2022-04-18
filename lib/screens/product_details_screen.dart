// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/product_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  final cartController = Get.put(CartController());
  final controller = Get.put(ProductController());

  final String title;
  final double price;
  final String image;
  final String description;

  ProductDetailsScreen(this.title, this.price, this.image, this.description,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Chip(
                      label: Text(
                        "Price:  " "₹" + this.price.toStringAsFixed(0),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "" + description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xff403B58),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
