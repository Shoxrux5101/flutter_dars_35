import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/features/reviews/widget/reviews_button.dart';

import '../../../core/network/api_client.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../data/repository/reviews/reviews_repository.dart';
import '../managers/reviews_view_model.dart';

class LeaveReviewPage extends StatefulWidget {
  const LeaveReviewPage({super.key, required this.id});

  final int id;

  @override
  State<LeaveReviewPage> createState() => _LeaveReviewPageState();
}

class _LeaveReviewPageState extends State<LeaveReviewPage> {
  int selectedRating = 0;

  TextEditingController controllerOne = TextEditingController();
  String selected = 'no';

  @override
  void dispose() {
    controllerOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(
        repository: ReviewsRepository(ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))),
        id: widget.id,
      ),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: AppColors.beige,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset("assets/icons/back-arrow.svg"),
          ),
          centerTitle: true,
          title: Text(
            'Leave a Review',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.redPinkMain,
            ),
          ),
        ),
        body: Consumer<ReviewsViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (vm.recipeData == null) {
              Center(
                child: Text(
                  "Ma'lumotlar topilmadi",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              );
            }
            final recipe = vm.recipeData!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  children: [
                    Container(
                      width: 356.w,
                      height: 262.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.redPinkMain,
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              recipe['photo'],
                              width: 356.w,
                              height: 206.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            recipe['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final starIndex = index + 1;
                        final isSelected = starIndex <= selectedRating;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRating = starIndex;
                            });
                          },
                          child: SvgPicture.asset(
                            isSelected
                                ? 'assets/icons/star.svg'
                                : 'assets/icons/star-empty.svg',
                            width: 28.w,
                            colorFilter: ColorFilter.mode(
                              AppColors.redPinkMain,
                              BlendMode.srcIn,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Your overall rating",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Leave us Review!',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.beige.withValues(
                                alpha: 0.45,
                              ),
                            ),
                            filled: true,
                            fillColor: AppColors.pink,
                            constraints: BoxConstraints(
                              maxWidth: 358.w,
                              maxHeight: 142.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 25.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  color: AppColors.pink,
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.pinkSub,
                                ),
                              ),
                            ),
                            Text(
                              'Add Photo',
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
                    SizedBox(
                      height: 22.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you recommend this recipe?',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'No',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Radio<String>(
                              value: 'No',
                              groupValue: selected,
                              fillColor: WidgetStatePropertyAll(
                                AppColors.redPinkMain,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Radio<String>(
                              value: 'Yes',
                              groupValue: selected,
                              focusColor: AppColors.redPinkMain,
                              fillColor: WidgetStatePropertyAll(
                                AppColors.redPinkMain,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 49.h,
                        ),
                        Row(
                          spacing: 19,
                          children: [
                            ReviewsButton(
                              onPressed: () {
                                context.pop();
                              },
                              backColor: AppColors.pink,
                              text: 'Cancel',
                              textColor: AppColors.pinkSub,
                            ),
                            ReviewsButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: SizedBox(
                                          width: 171.w,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Thank you for",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                  color: AppColors.beige
                                                ),
                                              ),
                                              Text(
                                                "Your Review!",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                  color: AppColors.beige,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      content: SizedBox(
                                        width: 276.w,
                                        height: 180.h,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: SvgPicture.asset(
                                                'assets/icons/big-tick.svg',
                                                width: 59.w,
                                                height: 59.h,
                                                color: AppColors.redPinkMain,
                                              ),
                                            ),
                                            SizedBox(height: 20.h),
                                            Padding(
                                              padding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 48,
                                                  ),
                                              child: Text(
                                                "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              context.go(Routes.homePage);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 207.w,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                color: AppColors.redPinkMain,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      30.r,
                                                    ),
                                              ),
                                              child: Text(
                                                'Go to home',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              backColor: AppColors.redPinkMain,
                              text: 'Submit',
                              textColor: AppColors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
