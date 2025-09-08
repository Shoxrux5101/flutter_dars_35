import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/features/trending_recipe/managers/trending_recipes_view_model.dart';
import '../../../core/utils/app_colors.dart';


class TrendingRecipeWidget extends StatelessWidget {
  const TrendingRecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingRecipesViewModel>(
        builder: (context,vm,child) {
          if(vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.recipes == null) {
            return const Center(child: Text("No data yet",style: TextStyle(color: Colors.white),));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w,vertical: 19.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending Recipe',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redPinkMain,
                  ),
                ),
                SizedBox(height: 9.h,),
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
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColors.pinkSub,
                              width: 2.w,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      vm.recipes!.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      vm.recipes!.description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
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
                                      SizedBox(width: 6.w,),
                                      Text(
                                        '${vm.recipes
                                            ?.timeRequired} min',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.pink,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${vm.recipes?.rating}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.pink,
                                        ),
                                      ),
                                      SizedBox(width: 5.w,),
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
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 153.h,
                          vm.recipes!.photo,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.w, top: 7.h),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              vm.toggleLike(vm.recipes!.id);
                            },
                            icon: SvgPicture.asset(
                              vm.likedItems.contains(vm.recipes!.id)
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
    );
  }
}