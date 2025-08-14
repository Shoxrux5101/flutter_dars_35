import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key, required this.text, required this.controller});

  final String text;
  final TextEditingController controller;

  @override
  State<PasswordInputField> createState() => _PasswordInputField();
}

class _PasswordInputField extends State<PasswordInputField> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
      Text(
      widget.text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
            hintText: "************",
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
