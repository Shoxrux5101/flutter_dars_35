import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class FollowButton extends StatefulWidget {
  final double width;
  final double height;
  final double textSize;
  const FollowButton({super.key, required this.width, required this.height, required this.textSize});

  @override
  State<FollowButton> createState() => FollowButtonState();
}

class FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFollowing = !isFollowing;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isFollowing ? AppColors.redPinkMain : AppColors.pink,
        ),
        child: Center(
          child: Text(
            'Following',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.textSize,
              color: isFollowing ? Colors.white : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
