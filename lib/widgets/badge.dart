// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_this, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;
  final Color textColor;

  const Badge({
    required this.child,
    required this.value,
    required this.color,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 6,
          top: 6,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: color,
              border: Border.all(
                color: textColor,
                width: 0.8,
              ),
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11, color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
