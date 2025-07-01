import 'package:delivery_box/constants/assets.dart';
import 'package:delivery_box/constants/colors.dart';
import 'package:flutter/material.dart';

class TastingBottomSheet {
  // Static method jo bottom sheet show karega
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => const TastingBottomSheetContent(),
    );
  }
}

class TastingBottomSheetContent extends StatefulWidget {
  const TastingBottomSheetContent({Key? key}) : super(key: key);

  @override
  State<TastingBottomSheetContent> createState() => _TastingBottomSheetContentState();
}

class _TastingBottomSheetContentState extends State<TastingBottomSheetContent> {
  // Bottom sheet ke variables
  bool isVegSelected = true;
  int selectedDate = 5;
  String selectedTimeSlot = '';
  double _bottomSheetHeight = 0.62;
  bool showSubTotal = false;
  bool showFullDetails = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: MediaQuery.of(context).size.height * _bottomSheetHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Tasting Session',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Veg/Non-Veg Toggle
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          _buildToggleButton(
                              'Veg items', isVegSelected, Colors.black,
                              () {
                            setState(() {
                              isVegSelected = true;
                            });
                          }, Image.asset(AppAssets.vegIcon)
                          ),
                          SizedBox(width: 50),
                          SizedBox(
                            child: Row(
                              children: [
                                Image.asset(AppAssets.nonVegIcon),
                                SizedBox(width: 8),
                                Text(
                                  'Non Veg items',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Date Selection
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDateItem(5, 'Mon'),
                        _buildDateItem(6, 'Tue'),
                        _buildDateItem(7, 'Wed'),
                        _buildDateItem(8, 'Thu'),
                        _buildDateItem(9, 'Fri'),
                        _buildDateItem(10, 'Sat'),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Time Slots
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _buildTimeSlot(
                          'Afternoon',
                          '12-02PM',
                          '4 slots left',
                          Icons.wb_sunny_outlined,
                          Colors.green,
                        ),
                        SizedBox(height: 12),
                        _buildTimeSlot(
                          'Evening',
                          '07-10PM',
                          '4 slots left',
                          Icons.nights_stay_outlined,
                          Colors.orange,
                        ),
                      ],
                    ),
                  ),

                  // Sub Total Section (Stage 2)
                  if (showSubTotal) ...[
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showFullDetails = true;
                          _bottomSheetHeight = 1; // Full screen
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sub total ₹30,000',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Inclusive charges and taxes',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ],

                  // Full Details Section (Stage 3)
                  if (showFullDetails) ...[
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _buildDetailRow('Plate price', '₹300'),
                          SizedBox(height: 16),
                          _buildDetailRow('No.of guests', '100'),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sub total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '₹30,000',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Excludes delivery charges and taxes',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Next Button
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: selectedTimeSlot.isEmpty ? null : () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedTimeSlot.isEmpty
                    ? Colors.grey.shade400 
                    : Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBackgroundColor: Colors.purple.shade200,
                disabledForegroundColor: Colors.white,
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildToggleButton(String text, bool isSelected, Color color,
      VoidCallback onTap, Widget image) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: image,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? color : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateItem(int date, String day) {
    bool isSelected = selectedDate == date;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: isSelected ? Colors.deepPurple.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.deepPurple.shade50)),
        child: Column(
          children: [
            Text(
              date.toString().padLeft(2, '0'),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primaryColor : Colors.black,
              ),
            ),
            Text(
              day,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.primaryColor : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String title, String time, String slots, IconData icon,
      Color dotColor) {
    bool isSelected = selectedTimeSlot == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeSlot = title;
          showSubTotal = true;
          _bottomSheetHeight = 0.72; // Expand to show sub total
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[50] : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.purple[200]! : Colors.grey[200]!,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey[600],
              size: 20,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  slots,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}