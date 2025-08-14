import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/router_name.dart';
import '../../../core/utils/app_colors.dart';

class BottomNavigationBarr extends StatelessWidget {
  const BottomNavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 112, vertical: 48),
      child: GestureDetector(
        onTap: () {
          context.go(RouterName.forgotPasswordPage);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.pink,
          ),
          width: 200.w,
          height: 45.h,
          child: Center(
            child: Text(
              'Continue',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppColors.redPinkMain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
