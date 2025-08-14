import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/forgot_password/widgets/email_input.dart';
import 'package:untitled3/features/forgot_password/widgets/email_input.dart';
import '../../../core/utils/app_colors.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.text, required this.hintText, required this.controller});

  final String text;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 36.w,
              vertical: 8.5.h,
            ),
            filled: true,
            fillColor: AppColors.pink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ],
    );
  }
}
