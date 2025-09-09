import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/features/home_page/widgets/recently_added_widget.dart';
import 'package:untitled3/features/home_page/widgets/top_chef_widget.dart';
import 'package:untitled3/features/home_page/widgets/trending_recipe_widget.dart';
import 'package:untitled3/features/home_page/widgets/your_recipes_widget.dart';
import '../../../core/router/routes.dart';

class HomePageWidgets  extends StatelessWidget {
  const HomePageWidgets ({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 19.h,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => context.push(Routes.trendingPage),
            child: TrendingRecipeWidget(),
          ),
          GestureDetector(
            onTap: () => context.push(Routes.yourRecipePage),
            child: YourRecipesWidget(),
          ),
          GestureDetector(
            onTap: () => context.push(Routes.chefsPage),
            child: TopChefWidget(jsonData: [1,2,3,4],),
          ),
           RecentlyAddedWidget(),
        ],
      ),
    );
  }
}
