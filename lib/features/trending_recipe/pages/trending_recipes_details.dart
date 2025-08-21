import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/features/trending_recipe/widgets/followButton.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../categories/managers/categopry_details_view_model.dart';
import '../widgets/custom_trending_app_bar.dart';


class TrendingRecipesDetails extends StatelessWidget {
  const TrendingRecipesDetails({super.key, required this.recipeId});

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryDetailsViewModel(recipeId: recipeId),
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, vm, child) {
          if (vm.isCategoryDetailsLoading) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final detail = vm.categoryDetails;
          if (detail == null) {
            return Scaffold(
              body: Center(child: Text(vm.error ?? '')),
            );
          }
          return Scaffold(
            appBar: CustomTrendingAppBar(title: detail.title,),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  buildHeaderCard(detail),
                  SizedBox(height: 26.h),
                  buildUserInfo(detail),
                  SizedBox(height: 20.h),
                  Divider(color: Colors.white),
                  SizedBox(height: 31.h),
                  buildDetails(detail),
                  SizedBox(height: 31.h),
                  buildIngredients(detail),
                  SizedBox(height: 31.h),
                  buildInstructions(detail),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        },
      ),
    );
  }

  Widget buildHeaderCard(detail) {
    return Container(
      height: 337.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.redPinkMain,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  detail.photo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 281.h,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: 74.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      color: AppColors.redPinkMain,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        width: 30.w,
                        height: 40.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  detail.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/star.svg', color: AppColors.white,),
                    Text(
                      "${detail.rating}",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    SizedBox(width: 10.h),
                    SvgPicture.asset(
                      'assets/icons/community.svg', color: Colors.white,
                      height: 10.h,),
                    SizedBox(width: 5.h),
                    Text(
                      "${detail.reviewsCount}",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildUserInfo(detail) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: NetworkImage(detail.user.profilePhoto),
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(detail.user.username,
                style: TextStyle(fontSize: 12, color: AppColors.redPinkMain)),
            Text(detail.user.firstName,
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        Spacer(),
        FollowButton(width: 109.w,height: 21.h, textSize: 12,),
        SizedBox(width: 9.w),
        Icon(Icons.more_vert, color: AppColors.redPinkMain),
      ],
    );
  }
  Widget buildDetails(detail) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.redPinkMain,
              ),
            ),
            SizedBox(width: 15.w),
            SvgPicture.asset(
              "assets/icons/clock.svg",
              color: Colors.white,
              width: 20.w,
            ),
            SizedBox(width: 5.w),
            Text("${detail.timeRequired}min",
                style: TextStyle(color: Colors.white)),
          ],
        ),
        Text(detail.description,style: TextStyle(color: AppColors.white),)
      ],
    );
  }
  Widget buildIngredients(detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
        SizedBox(height: 21.h),
        Text(
          detail.ingredients.map((e) => "${e.amount} ${e.name}").join("\n"),
          style: TextStyle(color: AppColors.white),
        ),
      ],
    );
  }
  Widget buildInstructions(detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '6 Easy Step',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
        SizedBox(height: 11.h),

        for (int i = 0; i < detail.instructions.length; i++)
          Container(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: i % 2 == 0 ? AppColors.pinkSub : AppColors.pink,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "${detail.instructions[i].order}. ${detail.instructions[i].text}",
              style: TextStyle(color: Colors.white),
            ),
          ),
      ],
    );
  }
}
