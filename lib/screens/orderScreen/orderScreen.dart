import 'package:delivery_box/constants/assets.dart';
import 'package:delivery_box/constants/colors.dart';
import 'package:delivery_box/screens/orderScreen/widgets/orderServiceCard.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isVegSelected = true;
  int selectedDate = 5;
  String selectedTimeSlot = '';
  double _bottomSheetHeight = 0.62;
  bool showSubTotal = false;
  bool showFullDetails = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Suggested Platters',
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quotation Generated Card
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: screenHeight * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE8F5E8)),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.17,
                    height: screenWidth * 0.17,
                    child: Image.asset(AppAssets.checkIcon),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quotation generated',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          'We have curated a quotation for you',
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Main Order Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              margin: EdgeInsets.only(bottom: screenHeight * 0.02),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with image and title
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(AppAssets.lunchBoxIcon),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Abhi's Birthday Platter",
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _showTastingBottomSheet();
                                  },
                                  child: Text(
                                    'View Menu',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: screenWidth * 0.04,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.025),

                  // Event Details
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event',
                              style: TextStyle(
                                fontSize: screenWidth * 0.037,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              'Birthday',
                              style: TextStyle(
                                fontSize: screenWidth * 0.036,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Guest count',
                              style: TextStyle(
                                fontSize: screenWidth * 0.037,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              '120 (30 Veg)',
                              style: TextStyle(
                                fontSize: screenWidth * 0.036,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Date and Time
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                fontSize: screenWidth * 0.037,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              '05/06/2025',
                              style: TextStyle(
                                fontSize: screenWidth * 0.036,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: TextStyle(
                                fontSize: screenWidth * 0.037,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              '06:30PM',
                              style: TextStyle(
                                fontSize: screenWidth * 0.036,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),

            // Price Section
            Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      AppAssets.priceCardIcon,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price ₹30,000',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          'Excluding delivery charges and taxes',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: screenWidth * 0.06,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),

            // Try Before You Decide Card
            Container(
              width: double.infinity,
              height: screenHeight * 0.235,
              margin: EdgeInsets.only(bottom: screenHeight * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                AppAssets.adsFrameImage,
                fit: BoxFit.cover,
              ),
            ),

            // Experience Our Services Section
            Text(
              'Experience our services',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            SizedBox(height: screenHeight * 0.015),

            // Service Cards Row
            SizedBox(
              height: screenHeight * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OrderServiceCard(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    title: "Birthday party",
                    subtitle: "Delivery Box", 
                    imagePath: AppAssets.birthdayParty1Image,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  OrderServiceCard(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    title: "Kitty party",
                    subtitle: "Value Catering", 
                    imagePath: AppAssets.kittyPartyImage,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  OrderServiceCard(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    title: "Birthday party",
                    subtitle: "Delivery Box", 
                    imagePath: AppAssets.birthdayParty2Image,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  OrderServiceCard(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    title: "Birthday party",
                    subtitle: "Delivery Box", 
                    imagePath: AppAssets.birthdayParty1Image,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // Customize with Expert Section
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F9F4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02,
                              vertical: screenHeight * 0.005,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 227, 247, 241),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Exclusive consultation',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: screenWidth * 0.025,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Customize with an expert\non call',
                            style: TextStyle(
                              fontSize: screenWidth * 0.038,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7C3AED),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Book now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.034,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.2,
                        child: Image.asset(
                          AppAssets.expertImage,
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // Customer Reviews Section
            Text(
              'Hear from our customers',
              style: TextStyle(
                fontSize: screenWidth * 0.042,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // Customer Review Cards
            SizedBox(
              height: screenHeight * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildReviewCard(
                    screenWidth,
                    screenHeight,
                    'Abhishek C',
                    'Delivery Box',
                    '5.0',
                    'assets/images/customer1.jpg',
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  _buildReviewCard(
                    screenWidth,
                    screenHeight,
                    'Jasmine T',
                    'Delivery Box',
                    '4.8',
                    'assets/images/customer2.jpg',
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  _buildReviewCard(
                    screenWidth,
                    screenHeight,
                    'Carlos M',
                    'Delivery Box',
                    '4.9',
                    'assets/images/customer1.jpg',
                  ),
                ],
              ),
            ),

            // Get the gang's opinion Card
            Container(
              width: double.infinity,
              height: screenHeight * 0.235,
              margin: EdgeInsets.only(bottom: screenHeight * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                AppAssets.gangsBanner,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: screenHeight * 0.001),

            // Cancel Option
            GestureDetector(
              onTap: () {
                // Handle cancel action
              },
              child: Card(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenHeight * 0.015),
                  child: Row(
                    children: [
                      Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: screenWidth * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.1),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 241, 250),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Save for later',
                    style: TextStyle(
                      color: const Color(0xFF7C3AED),
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                decoration: BoxDecoration(
                  color: const Color(0xFF7C3AED),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Sheet for Detailed Menu
  void _showTastingBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: MediaQuery.of(context).size.height * _bottomSheetHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Container(
            // height: 1000,
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
                                SizedBox(
                                  width: 10,
                                ),
                                _buildToggleButton(
                                    'Veg items', isVegSelected, Colors.black,
                                    () {
                                  setModalState(() {
                                    isVegSelected = true;
                                  });
                                }, Image.asset(AppAssets.vegIcon)
                                ),
                                SizedBox(width: 50),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.nonVegIcon,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
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
                              _buildDateItem(5, 'Mon', setModalState),
                              _buildDateItem(6, 'Tue', setModalState),
                              _buildDateItem(7, 'Wed', setModalState),
                              _buildDateItem(8, 'Thu', setModalState),
                              _buildDateItem(9, 'Fri', setModalState),
                              _buildDateItem(10, 'Sat', setModalState),
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
                                setModalState,
                              ),
                              SizedBox(height: 12),
                              _buildTimeSlot(
                                'Evening',
                                '07-10PM',
                                '4 slots left',
                                Icons.nights_stay_outlined,
                                Colors.orange,
                                setModalState,
                              ),
                            ],
                          ),
                        ),

                        // Sub Total Section (Stage 2)
                        if (showSubTotal) ...[
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setModalState(() {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          ? Colors.grey
                              .shade400 
                          : Colors.purple, // Enabled color
                      foregroundColor: Colors.white, // Text color hamesha white
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBackgroundColor:
                          Colors.purple.shade200, // Disabled 
                      disabledForegroundColor:
                          Colors.white, // Disabled text color
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
          ),
        ),
      ),
    );
  }

  // Customer Review Card
  Widget _buildReviewCard(double screenWidth, double screenHeight, String name,
      String service, String rating, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(AppAssets.customerImage))),
        Container(
          width: screenWidth * 0.6,
          padding: EdgeInsets.only(top: screenWidth * 0.03),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      service,
                      style: TextStyle(
                        fontSize: screenWidth * 0.028,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: screenWidth * 0.032,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    rating,
                    style: TextStyle(
                      fontSize: screenWidth * 0.028,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, Color color,
      VoidCallback onTap, Widget image) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : color,
          // border: Border.all(
          //   color: isSelected ? color : Colors.grey[300]!,
          // ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (isSelected)
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

  Widget _buildDateItem(int date, String day, StateSetter setModalState) {
    bool isSelected = selectedDate == date;
    return GestureDetector(
      onTap: () {
        setModalState(() {
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
      Color dotColor, StateSetter setModalState) {
    bool isSelected = selectedTimeSlot == title;

    return GestureDetector(
      onTap: () {
        setModalState(() {
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
