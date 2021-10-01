import 'package:flutter/material.dart';

Widget myBackgroundImage() {
  return Image.asset(
    'assets/images/triangle.jpeg',
    fit: BoxFit.cover,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
  );
}

