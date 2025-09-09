import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../data/repository/categories/category_repository.dart';
import '../../../data/repository/recipes/recipe_repository.dart';
import '../managers/recipe_view_model.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({
    super.key,
    required this.catId,
  });
  final int catId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) { final vm = RecipeViewModel(
        recipesRepository: context.read<RecipesRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
        catId: catId,
      );
        vm.fetchRecipes();
        vm.fetchCategories();
        return vm;
      },
      builder: (context, child) => Consumer<RecipeViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            extendBody: true,
            appBar: CustomAppBar(
              title: vm.categories.isNotEmpty
                  ? vm.categories
                  .firstWhere(
                    (x) => x.id == vm.selectedCategoryId,
                orElse: () => vm.categories.first,).title : 'title',
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 37),
              child: Column(
                children: [
                  SizedBox(
                     height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: vm.categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {

                        final category = vm.categories[index];
                        final isActive = category.id == vm.selectedCategoryId;

                        return GestureDetector(
                          onTap: () {
                            vm.changeCategory(category.id);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: isActive
                                  ? AppColors.redPinkMain
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                category.title,
                                style: TextStyle(
                                  color: isActive
                                      ? Colors.white
                                      : AppColors.redPinkMain,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 19.h),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 19.w,
                        mainAxisExtent: 226,
                      ),
                      itemCount: vm.recipes.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.push(
                            Routes.categoryDetailsPage,
                            extra: {"id":vm.recipes[index].id},
                          );
                        },
                        child: SizedBox(
                          width: 168.w,
                          height: 226.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 6,
                                  ),
                                  width: 155.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vm.recipes[index].title,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        vm.recipes[index].description,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${vm.recipes[index].rating}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.pink,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                  'assets/icons/star.svg'),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/clock.svg'),
                                              Text(
                                                '${vm.recipes[index].timeRequired} min',
                                                style:  TextStyle(
                                                  fontSize: 12,
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.network(
                                  vm.recipes[index].photo,
                                  alignment: Alignment.topCenter,
                                  fit: BoxFit.cover,
                                  width: 169.w,
                                  height: 153.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        },
      ),
    );
  }
}
