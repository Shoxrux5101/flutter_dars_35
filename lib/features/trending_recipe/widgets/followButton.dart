import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

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
        width: 109,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isFollowing ? AppColors.redPinkMain : AppColors.pink,
        ),
        child: Text(
          'Following',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isFollowing ? Colors.white : Colors.red,
          ),
        ),
      ),
    );
  }
}
