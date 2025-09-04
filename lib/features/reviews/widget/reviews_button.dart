import 'package:flutter/material.dart';

class ReviewsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backColor;
  final String text;
  final Color textColor;

  const ReviewsButton({
    super.key,
    required this.onPressed,
    required this.backColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
