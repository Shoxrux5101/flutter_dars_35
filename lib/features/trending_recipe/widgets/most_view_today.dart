import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/models/trending_recipes_model.dart';
import '../managers/trending_recipes_view_model.dart';

class MostViewToday extends StatelessWidget {
  final TrendingRecipesModel recipe;
  final TrendingRecipesViewModel vm;

  const MostViewToday({
    super.key,
    required this.recipe,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
      width: double.infinity,
      height: 260.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.redPinkMain,
      ),
      child: Column(
        spacing: 9.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most View Today',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 205.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 6,
                    ),
                    width: 348.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(14),
                        bottomLeft: Radius.circular(14),
                      ),
                      color: AppColors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                recipe.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/clock.svg'),
                                SizedBox(width: 6.w),
                                Text(
                                  '${recipe.timeRequired} min',
                                  style:  TextStyle(
                                    fontSize: 12,
                                    color: AppColors.pinkSub,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${recipe.rating}',
                                  style:  TextStyle(
                                    fontSize: 12,
                                    color: AppColors.pinkSub,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                SvgPicture.asset('assets/icons/star.svg'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    recipe.photo,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 153.h,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w, top: 7.h),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        if (recipe.id != null) {
                          vm.toggleLike(recipe.id);
                        }
                      },
                      icon: SvgPicture.asset(
                        vm.likedItems.contains(recipe.id)
                            ? 'assets/icons/dislike.svg'
                            : 'assets/icons/like.svg',
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
