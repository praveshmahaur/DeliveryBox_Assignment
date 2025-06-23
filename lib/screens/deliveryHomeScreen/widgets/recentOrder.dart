import 'package:delivery_box/constants/assets.dart';
import 'package:delivery_box/constants/colors.dart';
import 'package:flutter/material.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(8),
            //   image: DecorationImage(
            //     image: AssetImage('assets/birthday_platter.jpg'), // Placeholder
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: Colors.brown.shade300,
              ),
              child: Image.asset(AppAssets.recentOrderImage,fit: BoxFit.cover,),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Birthday platter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '#102026 • 40 guests',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 215, 227),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '20 mins',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
