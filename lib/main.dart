import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'locator.dart';
import 'checkoutPage.dart';

void main() {
  setupLocator();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData(),
      home: CheckoutPage(),
    ),
  );
}
