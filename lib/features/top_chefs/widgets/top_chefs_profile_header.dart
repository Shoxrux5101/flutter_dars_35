import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/trending_recipe/widgets/followButton.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/models/chefs_model.dart';

class TopChefsProfileHeader extends StatelessWidget {
  final ChefsModel chefsModel;

  const TopChefsProfileHeader({super.key, required this.chefsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.w,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                chefsModel.profilePhoto,
                width: 102.w,
                height: 97.h,
              ),
            ),
            Column(
              spacing: 7.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${chefsModel.firstName} ${chefsModel.lastName}-Chefs',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redPinkMain,
                  ),
                ),
                Text(
                  chefsModel.presentation,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColors.white,
                  ),
                ),
                FollowButton(
                  width: 81.w,
                  height: 19.h,
                  textSize: 10,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 13.h),
        Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Colors.transparent,
            border: Border.all(color: AppColors.pink),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(chefsModel.recipesCount, "Recipes"),
              Container(width: 1.w, height: 26.h, color: AppColors.white),
              _buildStat(chefsModel.followingCount, "Following"),
              Container(width: 1.w, height: 26.h, color: AppColors.white),
              _buildStat(chefsModel.followerCount, "Followers"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStat(int count, String label) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
        ),
      ],
    );
  }
}
