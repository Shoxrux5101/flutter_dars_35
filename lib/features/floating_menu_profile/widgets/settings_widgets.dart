import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/features/floating_menu_profile/pages/help_center.dart';
import 'package:untitled3/features/floating_menu_profile/pages/language.dart';
import 'package:untitled3/features/floating_menu_profile/pages/notification_setting_page.dart';
import 'package:untitled3/features/floating_menu_profile/pages/privacy_policy.dart';
import '../../../core/utils/app_colors.dart';

class SettingsWidgets extends StatelessWidget {
  const SettingsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 36.w, right: 36.w, top: 33.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 18.w,
                children: [
                  SvgPicture.asset('assets/icons/Notification Setting.svg'),
                  Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationSettingPage(),
                    ),
                  );
                },
                child: SvgPicture.asset('assets/icons/playSettings.svg'),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpCenter()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 18.w,
                  children: [
                    SvgPicture.asset('assets/icons/Help Center Setting.svg'),
                    Text(
                      "Help Center",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset('assets/icons/playSettings.svg'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivacyPolicy(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 18.w,
                  children: [
                    SvgPicture.asset('assets/icons/Security Setting.svg'),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset('assets/icons/playSettings.svg'),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageScreen(),),);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 18.w,
                  children: [
                    SvgPicture.asset('assets/icons/Lenguage Setting.svg'),
                    Text(
                      "Language",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset('assets/icons/playSettings.svg'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 18.w,
                children: [
                  SvgPicture.asset('assets/icons/Turn dark Theme.svg'),
                  Text(
                    "Turn dark Theme",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 18.w,
                children: [
                  SvgPicture.asset('assets/icons/Logout.svg'),
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "Delete Account",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.pinkSub,
            ),
          ),
        ],
      ),
    );
  }
}
