import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/app_colors.dart';
import 'onboarding_widget_2.dart';

class OnboardingWidget3 extends StatelessWidget {
  const OnboardingWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C0F0D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(height: 48),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingWidget2()));
                },
                icon: SvgPicture.asset(
                  'assets/icons/back-arrow.svg',
                  color:  Color(0xFFE23E3E),
                ),
              ),
            ),
             SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 27,
                  childAspectRatio: 170 / 167,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/onboarding/image_${index + 1}.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
             SizedBox(height: 24),
             Text(
              "Welcome",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 12),
             Text(
              "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
                height: 1.5.h,
              ),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 36),
            Column(
              children: [
                SizedBox(
                  width: 207.w,
                  height: 45.h,
                  child: ElevatedButton(
                    onPressed: () {context.go(Routes.loginPage);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child:  Text(
                      "I'm new",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.redPinkMain,
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 20),
                SizedBox(
                  width: 207,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {context.go(Routes.onboardingPage);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child:  Text(
                      "I've been here",
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
            SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
