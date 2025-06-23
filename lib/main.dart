import 'package:delivery_box/screens/deliveryHomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Box',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: DeliveryHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

