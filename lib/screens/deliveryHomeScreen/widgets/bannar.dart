import 'package:delivery_box/constants/assets.dart';
import 'package:delivery_box/constants/colors.dart';
import 'package:delivery_box/screens/orderScreen/orderScreen.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double containerHeight = screenWidth > 600 ? 200 : 280;

        return Container(
          width: screenWidth, // ✅ Use dynamic width
          height: containerHeight,
          child: Stack(
            children: [
              Image.asset(
                AppAssets.deliveryFrame,
                fit: BoxFit.cover,
                width: screenWidth, // ✅ Make sure image matches container
                height: containerHeight,
              ),
              Positioned(
                  top: containerHeight * 0.65,
                  left: screenWidth * 0.2,
                  child: Container(
                    color: AppColors.primaryColor,
                    height: containerHeight * 0.3,
                    width: screenWidth * 0.6,
                  )),
              Positioned(
                top: containerHeight * 0.7,
                left: screenWidth * 0.33,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderScreen()));
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // capsule shape
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Colors.white, // white button background
                  ),
                  child: Text(
                    'ORDER NOW',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
