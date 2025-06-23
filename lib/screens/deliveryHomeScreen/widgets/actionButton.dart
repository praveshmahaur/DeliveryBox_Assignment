import 'package:flutter/material.dart';



class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(child: _buildActionButton('Find My Platter', Icons.search, Colors.grey.shade100)),
        SizedBox(width: 12),
        Expanded(child: _buildActionButton('Create menu', Icons.create, Colors.grey.shade100)),
        SizedBox(width: 12),
        Expanded(child: _buildActionButton('Discounted Platters', Icons.local_offer, Colors.grey.shade100)),
      ],
    ),
  );
  }
}


Widget _buildActionButton(String title, IconData icon, Color backgroundColor) {
  return Container(
    height: 120,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Stack(
      children: [
        // Title at top-left
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        // Icon at bottom-right
        Align(
          alignment: Alignment.bottomRight,
          child: Icon(
            icon, 
            size: 32, 
            color: Colors.black54
          ),
        ),
      ],
    ),
  );
}
