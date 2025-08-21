import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/utils/app_colors.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({super.key});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}
class _CustomToggleState extends State<CustomToggle> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 33.w,
        height: 15.h,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: isOn ? AppColors.redPinkMain : AppColors.redPinkMain.withOpacity(0.4),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 300),
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 12.w,
            height: 12.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
