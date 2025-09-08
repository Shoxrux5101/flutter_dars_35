import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/router/routes.dart';
import 'package:untitled3/features/recipes/managers/recipe_view_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/repository/categories/category_repository.dart';
import '../../../data/repository/recipes/recipe_repository.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key,});


  @override
  Size get preferredSize => Size.fromHeight(120.h);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final vm = RecipeViewModel(
          recipesRepository: context.read<RecipesRepository>(),
          categoryRepository: context.read<CategoryRepository>(),
        );
        vm.fetchRecipes();
        vm.fetchCategories();
        return vm;
      },
      builder: (context, child) {
        return Consumer<RecipeViewModel>(
          builder: (context, vm, child) {
            if (vm.selectedCategoryId == 0){
              vm.selectedCategoryId = 2;
            }
            if (vm.isLoading) {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            return Scaffold(
              extendBody: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: false,
                title: Padding(
                  padding: EdgeInsets.only(left: 38.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi! Dianne',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: AppColors.redPinkMain,
                            ),
                          ),
                          Text(
                            'What are you cooking today',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 38.w, bottom: 27.h),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/notification.svg'),
                            SizedBox(width: 5.w),
                            SvgPicture.asset('assets/icons/search.svg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(39.h),
                  child: SizedBox(
                    height: 39.h,
                    child: vm.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: [
                        for (var category in vm.categories)
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: GestureDetector(
                              onTap: () {
                                vm.changeCategory(category.id);
                                context.push(
                                  Routes.recipePage,
                                  extra: category.id,
                                );
                              },
                              child: Container(
                                height: 25.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: category.id == vm.selectedCategoryId
                                      ? AppColors.redPinkMain
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    category.title,
                                    style: TextStyle(
                                      color: category.id == vm.selectedCategoryId
                                          ? Colors.white
                                          : AppColors.redPinkMain,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
