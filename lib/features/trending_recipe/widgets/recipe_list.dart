import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../recipes/managers/recipe_view_model.dart';

class RecipeList extends StatelessWidget {
  final RecipeViewModel vm;

  const RecipeList({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            'See All',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.redPinkMain,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: vm.recipes.length,
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 15.h),
            itemBuilder: (context, index) {
              final recipe = vm.recipes[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w, top: 10.h),
                        child: Container(
                          width: 207.w,
                          height: 122.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.pinkSub,
                              width: 2.w,
                            ),
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14.r),
                              bottomRight: Radius.circular(14.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  recipe.description,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  recipe.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: AppColors.pinkSub,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/clock.svg',
                                        ),
                                        Text(
                                          ' ${recipe.timeRequired} min',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.pinkSub,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          ' ${recipe.difficulty}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.pinkSub,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/fire.svg',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          ' ${recipe.rating}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.pinkSub,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/star.svg',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Stack(
                        children: [
                          Image.network(
                            recipe.photo,
                            width: 151.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 3,
                            right: 3,
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
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
