import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/features/categories/widgets/categories_widget.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../managers/category_page_view_model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryPageViewModel(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: CustomAppBar(
          title: "Categories",
        ),
        body: CategoriesWidget(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
