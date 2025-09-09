import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../core/utils/app_colors.dart';
import '../widgets/faq_item_widget.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  bool isFAQSelected = true;
  String selectedCategory = 'General';

  final List<FAQItem> faqItems = [
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet et dolore?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet et dolore?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor ut labore et dolore?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet ut dolore?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit labore et dolore?",
      answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
  ];

  final List<ContactOption> contactOptions = [
    ContactOption(
      title: "Website",
      icon: Icons.language,
    ),
    ContactOption(
      title: "Facebook",
      icon: Icons.facebook,
    ),
    ContactOption(
      title: "Whatsapp",
      icon: Icons.chat,
    ),
    ContactOption(
      title: "Instagram",
      icon: Icons.camera_alt,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/back-arrow.svg'),
        ),
        centerTitle: true,
        title: Text(
          "Help Center",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFAQSelected = true;
                        });
                      },
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: isFAQSelected ? AppColors.redPinkMain : AppColors.redPinkMain.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Center(
                          child: Text(
                            'FAQ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFAQSelected = false;
                        });
                      },
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: !isFAQSelected ? AppColors.redPinkMain : AppColors.redPinkMain.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Center(
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              if (isFAQSelected) ...[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryButton('General', isSelected: selectedCategory == 'General'),
                      SizedBox(width: 16.w),
                      _buildCategoryButton('Account', isSelected: selectedCategory == 'Account'),
                      SizedBox(width: 16.w),
                      _buildCategoryButton('Services', isSelected: selectedCategory == 'Services'),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 1,
                ),
                SizedBox(height: 24.h),

                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),

                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.redPinkMain.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.white70),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white70),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 32.h),

                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: faqItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemBuilder: (context, index) {
                    return FAQItemWidget(
                      faqItem: faqItems[index],
                    );
                  },
                ),
              ],

              if (!isFAQSelected) ...[
                SizedBox(height: 24.h),

                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.redPinkMain.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.white70),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white70),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 32.h),

                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contactOptions.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    return _buildContactOption(contactOptions[index]);
                  },
                ),
              ],

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _buildCategoryButton(String text, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.redPinkMain : AppColors.redPinkMain.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildContactOption(ContactOption option) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              shape: BoxShape.circle,
            ),
            child: Icon(
              option.icon,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              option.title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.redPinkMain,
            size: 16.sp,
          ),
        ],
      ),
    );
  }
}

class ContactOption {
  final String title;
  final IconData icon;

  ContactOption({
    required this.title,
    required this.icon,
  });
}