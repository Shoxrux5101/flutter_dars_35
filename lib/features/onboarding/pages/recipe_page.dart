import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/features/onboarding/pages/home_page_view_model.dart';
import 'package:untitled3/features/onboarding/pages/recipe_view_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../core/widgets/custom_app_bar.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({
    super.key, required this.catId,
  });
final int catId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel(catId:catId),
      builder:(context, child)=> Consumer<RecipeViewModel>(
        builder: (context, vm, child) {
          if(vm.isCuisinesLoading) return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          return Scaffold(
          appBar: CustomAppBar(title: vm.categories.singleWhere((x)=>x.id==vm.catId).title),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 37),
            child: Column(
              children: [
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
                      onTap: () {},
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      vm.recipes[index].title,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      maxLines: 2,
                                      vm.recipes[index].description,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          spacing: 5.w,
                                          children: [
                                            Text(
                                              '${vm.recipes[index].rating}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.pink,
                                              ),
                                            ),
                                            SvgPicture.asset('assets/icons/star.svg'),
                                          ],
                                        ),
                                        Row(
                                          spacing: 5.w,
                                          children: [
                                            SvgPicture.asset('assets/icons/clock.svg'),
                                            Text(
                                              '${vm.recipes[index].timeRequired} min',
                                              style: TextStyle(
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
                                  alignment: Alignment.topCenter,
                                  fit: BoxFit.cover,
                                  width: 169.w,
                                    height: 153.h,
                                    vm.recipes[index].photo,
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
