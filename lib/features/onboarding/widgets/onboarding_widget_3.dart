import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/features/onboarding/widgets/cooking_level.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/app_colors.dart';
import 'onboarding_widget_2.dart';

class OnboardingWidget3 extends StatelessWidget {
  const OnboardingWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/onboarding/img_1.png',
      'assets/onboarding/img_2.png',
      'assets/onboarding/img_3.png',
      'assets/onboarding/img_4.png',
      'assets/onboarding/img_5.png',
      'assets/onboarding/img.png',
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingWidget2()));
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/back-arrow.svg',
                    color: AppColors.redPinkMain,
                  ),
                ),
              ),
              Expanded(
                child:
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: imagePaths.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 27,
                    childAspectRatio: 180 / 160,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(imagePaths[index]),
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
              Column(
                children: [
                  SizedBox(
                    width: 207.w,
                    height: 45.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CookingLevel()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "I'm new",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.redPinkMain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 207,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(Routes.loginPage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
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
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}