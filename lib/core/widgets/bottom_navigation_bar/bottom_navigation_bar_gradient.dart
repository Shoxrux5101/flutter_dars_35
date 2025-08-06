import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class BottomNavigationBarGradient extends StatelessWidget {
  const BottomNavigationBarGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.beige,Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )
      ),
    );
  }
}
