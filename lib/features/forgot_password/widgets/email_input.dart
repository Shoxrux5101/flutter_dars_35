import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

class EmailInput extends StatelessWidget {
  EmailInput({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 53.h,
        ),
        Text(
          'Hello there!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Enter your email address. We will send a code verification in the next step.',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 43.h,
        ),
        Text(
          'Email',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 40.h,
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 35.w,
                vertical: 8.h,
              ),
              filled: true,
              fillColor: AppColors.pink,
              hintText: 'example@example.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
