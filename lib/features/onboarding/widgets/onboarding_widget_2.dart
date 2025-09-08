import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/features/onboarding/widgets/onboarding_widget_1.dart';

import '../../../core/utils/app_colors.dart';
import 'onboarding_widget_3.dart';

class OnboardingWidget2 extends StatelessWidget {
  const OnboardingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.beige,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/onboarding2.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.beige,
                    Colors.transparent,
                    AppColors.beige,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingWidget1()));
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/back-arrow.svg',
                        color:  AppColors.redPinkMain,
                      ),
                    ),
                     SizedBox(height: 20),
                     Text(
                      "Get An Increase Your Skills",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                     SizedBox(height: 12),
                     Text(
                      "Learn essential cooking techniques at your own pace.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingWidget3()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  AppColors.pink,
                      disabledBackgroundColor:  AppColors.redPinkMain,
                      minimumSize:  Size(207,45),
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.redPinkMain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
