import 'package:flutter/material.dart';
import 'package:shop_management/pages/homepage.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}
