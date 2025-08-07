import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/core/widgets/custom_app_bar.dart';
import 'package:untitled3/features/onboarding/managers/categopry_details_view_model.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key, required this.recipeId});
  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryDetailsViewModel(recipeId: recipeId),
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, vm, _) {
          if (vm.isCategoryDetailsLoading) {
            return const Scaffold(
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
            appBar: CustomAppBar(title: detail.title),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  _buildHeaderCard(detail),
                  SizedBox(height: 26.h),
                  _buildUserInfo(detail),
                  SizedBox(height: 20.h),
                  const Divider(color: Colors.white),
                  SizedBox(height: 31.h),
                  _buildDetails(detail),
                  SizedBox(height: 31.h),
                  _buildIngredients(detail),
                  SizedBox(height: 31.h),
                  _buildInstructions(detail),
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigation(),
          );
        },
      ),
    );
  }

  Widget _buildHeaderCard(detail) {
    return Container(
      height: 337.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.redPinkMain,
      ),
      child: Column(
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
                    SvgPicture.asset('assets/icons/star.svg',color: AppColors.white,),
                    Text(
                      "${detail.rating}",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(width: 10.h),
                    SvgPicture.asset('assets/icons/community.svg', color: Colors.white,
                    height: 10.h,),
                    SizedBox(width: 5.h),
                    Text(
                      "${detail.reviewsCount}",
                      style: TextStyle(fontSize: 12, color: Colors.white),
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

  Widget _buildUserInfo(detail) {
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
            Text(detail.user.username, style: const TextStyle(fontSize: 12, color: Colors.white)),
            Text(detail.user.firstName, style: const TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        const Spacer(),
        Container(
          width: 109,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.pink,
          ),
          child: const Text(
            'Following',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        ),
        SizedBox(width: 9.w),
        const Icon(Icons.more_vert, color: Colors.white),
      ],
    );
  }

  Widget _buildDetails(detail) {
    return Row(
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
        Text("${detail.timeRequired}min", style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildIngredients(detail) {
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
  Widget _buildInstructions(detail) {
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
        ...detail.instructions.asMap().entries.map((entry) {
          final index = entry.key;
          final instruction = entry.value;
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: index.isEven ? AppColors.pinkSub : AppColors.pink,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text("${instruction.order}. ${instruction.text}"),
          );
        }).toList(),
      ],
    );
  }
}
