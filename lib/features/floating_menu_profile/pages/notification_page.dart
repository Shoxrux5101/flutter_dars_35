import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/core/widgets/custom_toggle.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/back-arrow.svg'),
        ),
        centerTitle: true,
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 36,right: 36,top: 33),
        child: Column(
          spacing: 27,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('General Notification',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.white,),),
                CustomToggle(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sound',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.white,),),
                CustomToggle(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sound Call',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.white,),),
                CustomToggle(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vibrate',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.white,),),
                CustomToggle(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
