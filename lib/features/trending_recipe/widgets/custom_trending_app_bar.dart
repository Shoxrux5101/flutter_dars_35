import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';


class CustomTrendingAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;

  CustomTrendingAppBar({
    super.key,
    required this.title,

  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset('assets/icons/back-arrow.svg',
          color: AppColors.redPinkMain,
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {

            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.redPinkMain,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/like1.svg',
                  color: AppColors.white,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(right: 24),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.redPinkMain,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/share.svg',
                  color: AppColors.white,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
      ],

    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);
}
