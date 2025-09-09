import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/core/router/routes.dart';
import 'package:untitled3/features/onboarding/widgets/onboarding_widget_1.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingWidget1()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redPinkMain,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dishdash.png',
              width: 153.w,
              height: 153.h,
            ),
            Text(
              "DishDash",
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}