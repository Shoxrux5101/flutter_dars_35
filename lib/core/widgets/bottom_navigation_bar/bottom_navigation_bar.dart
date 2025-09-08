import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/core/router/routes.dart';
import '../../utils/app_colors.dart';

class BottomNavigationBarMain extends StatelessWidget {
  const BottomNavigationBarMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 34.h,left: 74,right: 74),
      child: Container(
        width: 281.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(33.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){context.go(Routes.homePage);}, icon: SvgPicture.asset("assets/icons/home.svg"),),
            IconButton(onPressed: (){context.go(Routes.communityPage);}, icon: SvgPicture.asset("assets/icons/community.svg"),),
            IconButton(onPressed: (){context.go(Routes.categoryPage);}, icon: SvgPicture.asset("assets/icons/categories.svg"),),
            IconButton(onPressed: (){context.go(Routes.profile);}, icon: SvgPicture.asset("assets/icons/profile.svg"),),
          ],
        ),
      ),
    );
  }
}