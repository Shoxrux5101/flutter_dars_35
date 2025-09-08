import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/features/onboarding/managers/onboarding_view_model.dart';
import 'package:untitled3/features/onboarding/widgets/cooking_level.dart';
import 'package:untitled3/features/onboarding/widgets/onboarding_widget_3.dart';
import 'package:untitled3/features/onboarding/widgets/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../widgets/allergic.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
int currentPage = 0;

Alignment getAlignment() {
  switch(currentPage){
    case 0:
    return Alignment.centerLeft;
    case 1:
      return Alignment.center;
    case 2:
      return Alignment.centerRight;
    default:
      return Alignment.centerLeft;
  }
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, vm, child) {
          if (vm.isOnboardingLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final boarding = vm.onboarding;
          if (boarding == null) {
            return Scaffold(
              body: Center(child: Text(vm.error ?? 'Error')),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  if (currentPage > 0) {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }else {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingWidget3()));
                  }
                },
                icon: SvgPicture.asset(
                  'assets/icons/back-arrow.svg',
                  color: AppColors.redPinkMain,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20.h),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 230.w,
                    height: 12.h,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: getAlignment(),
                      child: Container(
                        width: 80.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redPinkMain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                Center(child: CookingLevel()),
                Center(child: Preferences()),
                Center(child: Allergic()),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentPage == 1) ...[
                    Container(
                      width: 162.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.redPinkMain,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                  GestureDetector(
                    onTap: () {
                      if (currentPage < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: Container(
                      width: 162.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: AppColors.redPinkMain,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

