import 'package:delivery_box/constants/assets.dart';
import 'package:delivery_box/constants/colors.dart';
import 'package:flutter/material.dart';


class CustumHeader extends StatelessWidget {
  const CustumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      // padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Location with icon
          Row(
            children: [
              Image.asset(AppAssets.locationIcon),
              SizedBox(width: 8),
              Text(
                'Hyderabad',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // Right side - Headphone icon
          Image.asset(AppAssets.headsetIcon)
        ],
      ),
    );
  }
}