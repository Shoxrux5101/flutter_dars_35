import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/utils/app_colors.dart';

class OnboardingWidget1 extends StatefulWidget {
  const OnboardingWidget1({super.key});

  @override
  State<OnboardingWidget1> createState() => _OnboardingWidget1State();
}

class _OnboardingWidget1State extends State<OnboardingWidget1> {
  int selectedIndex = -1;

  final List<Map<String, String>> cookingLevels = [
    {'title': 'Novice',
      'subtitle':
      'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',},
    {'title': 'Intermediate',
      'subtitle':
      'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque pulvinar diam.',},
    {'title': 'Advanced',
      'subtitle':
      'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',},
    {'title': 'Professional',
      'subtitle':
      'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada.',},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿What is your cooking level?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Please select your cooking level for better recommendations.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 20.h),
          Column(
            children: List.generate(cookingLevels.length, (index) {
              final item = cookingLevels[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  padding:
                  EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.redPinkMain
                          : AppColors.pink,
                      width: 2.w,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        item['subtitle']!,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
