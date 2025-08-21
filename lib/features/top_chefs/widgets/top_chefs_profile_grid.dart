import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/models/recipe_model.dart';

class TopChefsProfileGrid extends StatelessWidget {
  final List<RecipeModel> recipes;

  const TopChefsProfileGrid({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        // shrinkWrap: true,
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19,
          mainAxisSpacing: 70,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -53,
                left: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14.r),
                      bottomRight: Radius.circular(14.r),
                    ),
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  width: 160.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          recipe.title,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          recipe.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(recipe.rating.toString(), style: TextStyle(color: AppColors.pink)),
                              SvgPicture.asset('assets/icons/star.svg', color: AppColors.pink),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/clock.svg', color: AppColors.pink),
                              SizedBox(width: 4),
                              Text('${recipe.timeRequired}min', style: TextStyle(color: AppColors.pink)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  recipe.photo,
                  height: 153.h,
                  width: 170.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );

        },
      ),
    );
  }
}
