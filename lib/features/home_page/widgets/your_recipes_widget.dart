import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/data/repository/categories/category_repository.dart';
import 'package:untitled3/data/repository/recipes/recipe_repository.dart';
import '../../../core/utils/app_colors.dart';
import '../../recipes/managers/recipe_view_model.dart';

class YourRecipesWidget extends StatelessWidget {
  const YourRecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel(recipesRepository: RecipesRepository(apiClient: ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))),
          categoryRepository: CategoryRepository(apiClient: ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))),
          ),
      builder: (context, child) =>
          Consumer<RecipeViewModel>(
            builder: (context, vm, child) {
              if (vm.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (vm.recipes.isEmpty) {
                return Center(
                  child: Text("No data",style: TextStyle(color: Colors.white),),
                );
              }
              return Container(
                width: double.infinity,
                height: 255.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.redPinkMain,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 38.w, vertical: 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Recipe',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 160.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.recipes.length,
                          itemBuilder: (context, index) {
                            final item = vm.recipes[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 17.w),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.network(
                                      vm.recipes[index].photo,
                                      width: 169.w,
                                      height: 153.h,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        vm.toggleLike(item.id);
                                      },
                                      icon: SvgPicture.asset(
                                        vm.likedItems.contains(item.id)
                                            ? 'assets/icons/dislike.svg'
                                            : 'assets/icons/like.svg',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 169.w,
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            13.r),
                                        color: AppColors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              vm.recipes[index].title,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/star.svg'),
                                                Text(vm.recipes[index].rating
                                                    .toString(),
                                                  style:TextStyle(
                                                      color: AppColors.pinkSub
                                                  ),
                                                ),
                                                SizedBox(width: 26.w,),
                                                SvgPicture.asset(
                                                    'assets/icons/clock.svg'),
                                                Text('${vm.recipes[index]
                                                    .timeRequired
                                                    .toString()} min',
                                                  style:TextStyle(
                                                      color: AppColors.pinkSub
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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