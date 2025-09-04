import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../router/routes.dart';
import '../utils/app_colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;

   const CustomAppBar({
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
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
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
          padding:  EdgeInsets.only(right: 24),
          child: GestureDetector(
            onTap: () {
              Routes.settings;
            },
            child: Container(
              width: 40,
              height: 40,
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

    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);
}
