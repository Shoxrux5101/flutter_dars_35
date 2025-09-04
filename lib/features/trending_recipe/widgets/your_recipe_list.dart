import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../recipes/managers/recipe_view_model.dart';

class YourRecipeList extends StatelessWidget {
  final RecipeViewModel vm;
  final Function(int recipeId)? onRecipeTap;

  const YourRecipeList({
    super.key,
    required this.vm,
    this.onRecipeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18.w,
              mainAxisSpacing: 30.h,
              childAspectRatio: 170.w / 200.h,
            ),
            itemCount: vm.recipes.length,
            itemBuilder: (context, index) {
              final recipe = vm.recipes[index];
              return SizedBox(
                width: 170.w,
                height: 226.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(right:20),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                          width: 160.w,
                          height: 76.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            color: AppColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/clock.svg'),
                                      SizedBox(width: 6.w),
                                      Text(
                                        '${recipe.timeRequired} min',
                                        style: TextStyle(
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
                                        style: TextStyle(
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
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        recipe.photo,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        width: 170.w,
                        height: 153.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 28.w, top: 7.h),
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
              );
            },
          )
        ),
      ],
    );
  }
}