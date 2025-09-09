import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back-arrow.svg',
            color: AppColors.redPinkMain,
            width: 22,
            height: 14,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding:  EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Today'),
          _buildNotificationItem(
            title: 'Weekly New Recipes!',
            description: 'Discover our new recipes of the week!',
            time: '2 Min Ago',
          ),
          _buildNotificationItem(
            title: 'Meal Reminder',
            description: 'Time to cook your healthy meal of the day',
            time: '35 Min Ago',
          ),
          SizedBox(height: 24),
          _buildSectionHeader('Wednesday'),
          _buildNotificationItem(
            title: 'New Update Available',
            description: 'Performance improvements and bug fixes.',
            time: '25 April 2024',
          ),
          _buildNotificationItem(
            title: 'Reminder',
            description: 'Don\'t forget to complete your profile to access all app features',
            time: '25 April 2024',
          ),
          _buildNotificationItem(
            title: 'Important Notice',
            description: 'Remember to change your password regularly to keep your account secure',
            time: '25 April 2024',
          ),
          SizedBox(height: 24),
          _buildSectionHeader('Monday'),
          _buildNotificationItem(
            title: 'New Update Available',
            description: 'Performance improvements and bug fixes.',
            time: '22 April 2024',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style:  TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    );
  }
  Widget _buildNotificationItem({
    required String title,
    required String description,
    required String time,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    margin:  EdgeInsets.only(top: 8, right: 12),
                    decoration:  BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: SvgPicture.asset('assets/icons/star.svg',color: AppColors.redPinkMain,width: 27,height: 27,)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          time,
          style:  TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8,),
      ],
    );
  }
}