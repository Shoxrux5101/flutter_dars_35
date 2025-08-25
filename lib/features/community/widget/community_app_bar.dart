import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/app_colors.dart';
import '../widget/community_bottom_app_bar.dart';

class CommunityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        icon: SvgPicture.asset(
          'assets/icons/back-arrow.svg',
          color: AppColors.redPinkMain,
        ),
      ),
      centerTitle: true,
      title: Text(
        "Community",
        style: TextStyle(
          color: AppColors.redPinkMain,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  color: AppColors.redPinkMain,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: AppColors.redPinkMain,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
      ],
      bottom: const CommunityBottomAppBar(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 48);
}
