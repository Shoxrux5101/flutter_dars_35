import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLike = !isLike;
        });
      },
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isLike ? AppColors.redPinkMain : AppColors.pink,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/like.svg',
            color: isLike ? AppColors.white : AppColors.redPinkMain,
          ),
        ),
      ),
    );
  }
}
