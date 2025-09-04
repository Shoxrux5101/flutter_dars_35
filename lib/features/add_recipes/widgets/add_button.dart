import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AddButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF6B6B),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 5,
        ),
        child: Text(text, style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
