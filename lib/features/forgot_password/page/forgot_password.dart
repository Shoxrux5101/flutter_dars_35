import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/features/forgot_password/widgets/email_input.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/otp_code.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Forgot your password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Column(
          children: [
            EmailInput(),

          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBarr(),

    );
  }
}
