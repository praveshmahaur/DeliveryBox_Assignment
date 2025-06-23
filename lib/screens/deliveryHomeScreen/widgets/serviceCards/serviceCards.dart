import 'package:delivery_box/constants/assets.dart';
import 'package:flutter/material.dart';


class ServiceCards extends StatelessWidget {
  const ServiceCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(left: 10),
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Column - 1 Card
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  _buildServiceCard(
                    'Delivery Box',
                    '10 - 150 guests',
                    Image.asset(AppAssets.deliveryboxImage),
                    Colors.grey.shade50,
                    Colors.purple,
                    cardHeight: 300,
                    isFirstColumn: true, // Normal image position
                  ),
                ],
              ),
            ),
            // Second Column - 2 Cards
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  _buildServiceCard(
                    'Meal Box',
                    '10 to 1500+ guests',
                    Image.asset(AppAssets.mealBoxcardImage),
                    Colors.grey.shade50,
                    Colors.orange,
                    hasExclusive: false,
                    cardHeight: 140,
                    isFirstColumn: false, // Bottom right image
                  ),
                  SizedBox(height: 12),
                  _buildServiceCard(
                    'Catering',
                    '10 to 1500+ guests',
                    Image.asset(AppAssets.cateringCardImage),
                    Colors.grey.shade50,
                    Colors.brown,
                    hasExclusive: true,
                    cardHeight: 140,
                    isFirstColumn: false, // Bottom right image
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
  }
}

// Updated Service Card with customizable height and width
Widget _buildServiceCard(
  String title, 
  String subtitle, 
  Widget image,
  Color backgroundColor, 
  Color iconColor, {
  bool hasExclusive = false,
  double? cardHeight,
  double? cardWidth,
  bool isFirstColumn = true, // New parameter to control image position
}) {
  return Container(
    height: cardHeight ?? 200, // Default height 200, customizable
    width: cardWidth, // Optional width constraint
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Stack(
      children: [
        if (hasExclusive)
          Positioned(
            bottom: 25,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
              ),
              child: Text(
                'Exclusive',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              // Only show expanded image for first column
              if (isFirstColumn) ...[
                SizedBox(height: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: image,
                  ),
                ),
              ],
            ],
          ),
        ),
        // Bottom right image for second column cards
        if (!isFirstColumn)
          Positioned(
            bottom:0 ,
            right: 10,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: image,
              ),
            ),
          ),
      ],
    ),
  );
}