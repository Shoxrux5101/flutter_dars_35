import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        IconButton(
          color: AppColors.pink,
          onPressed: (){},
          padding: EdgeInsets.only(right: 5),
          icon: SvgPicture.asset('assets/icons/notification.svg',
            color: AppColors.pink,
            width: 28,
            height: 28,
          ),
        ),
        IconButton(
          onPressed: (){},
          padding: EdgeInsets.only(right: 37),
          icon: SvgPicture.asset('assets/icons/search.svg',
            color: AppColors.pink,
            width: 28,
            height: 28,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
