import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/data/repository/categories/category_repository.dart';
import 'package:untitled3/data/repository/recipes/recipe_repository.dart';
import 'package:untitled3/features/recipes/managers/recipe_view_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/repository/categories/category_repository_local.dart';
import '../../../data/repository/categories/category_repository_remote.dart';

class RecentlyAddedWidget extends StatelessWidget {
  const RecentlyAddedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel(
        recipesRepository: RecipesRepository(
          apiClient: ApiClient(
            interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()),
          ),
        ),
        categoryRepository: CategoryRepository(apiClient: ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))),
      ),
      child: Consumer<RecipeViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.errorMessage != null) {
            return Center(child: Text('Error: ${vm.errorMessage}'));
          }
          if(vm.recipes.isEmpty) {
            return SizedBox();
          }
          if(vm.categories.isEmpty) {
            return SizedBox();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 19.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recently Added',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redPinkMain,
                  ),
                ),
                SizedBox(
                  height: 238.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.recipes.length,
                    itemBuilder: (context, index) {
                      final item = vm.recipes[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 6,
                                  ),
                                  width: 155.w,
                                  height: 85.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        item.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${item.rating}',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.pink,
                                                ),
                                              ),
                                              SizedBox(width: 5.w),
                                              SvgPicture.asset(
                                                'assets/icons/star.svg',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/clock.svg',
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                '${item.timeRequired} min',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.pink,
                                                ),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                item.photo,
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                                width: 169.w,
                                height: 153.h,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
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
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
