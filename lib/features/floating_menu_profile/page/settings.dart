import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:untitled3/features/floating_menu_profile/widgets/settings_widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context);
          },
          icon: SvgPicture.asset('assets/icons/back-arrow.svg'),
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: SettingsWidgets(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
