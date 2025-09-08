import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

class DateInputField extends StatelessWidget {
  const DateInputField({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
  });

  final String text;
  final String hintText;
  final TextEditingController controller;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.redPinkMain,
              onPrimary: Colors.black,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.redPinkMain,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }
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
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
            suffixIcon: Icon(Icons.calendar_month, color: Colors.black),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 36.w,
              vertical: 12.h,
            ),
            filled: true,
            fillColor: AppColors.pink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
