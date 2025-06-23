import 'package:flutter/material.dart';
import 'package:delivery_box/screens/deliveryHomeScreen/widgets/actionButton.dart';
import 'package:delivery_box/screens/deliveryHomeScreen/widgets/recentOrder.dart';
import 'package:delivery_box/screens/deliveryHomeScreen/widgets/serviceCards/serviceCards.dart';
import 'package:delivery_box/screens/deliveryHomeScreen/widgets/bannar.dart';
import 'package:delivery_box/screens/deliveryHomeScreen/widgets/header.dart';
import 'package:delivery_box/screens/deliveryHomeScreen/widgets/tabbar.dart';

class DeliveryHomePage extends StatelessWidget {
  const DeliveryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustumHeader(),
            Transform.translate(
              offset: Offset(0, -1), // Push tabBar up slightly
              child: CustomTabbar(),
            ),
            Transform.translate(
              offset: Offset(0, -1), // Push tabBar up slightly
              child: CustomBanner(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: ServiceCards(),
                    ),
                    ActionButton(),
                    RecentOrder(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}