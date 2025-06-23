import 'package:delivery_box/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({super.key});

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['All', 'Delivery Box', 'Catering', 'Meal Box'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: EdgeInsets.zero, // ✅ Ensure no padding
      margin: EdgeInsets.zero,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedTabIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTabIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepPurple : const Color.fromARGB(255, 80, 7, 152),
                borderRadius: BorderRadius.circular(14),
                // border: Border.all(
                //   color: isSelected ? Colors.purple : Colors.grey.shade300,
                // ),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}