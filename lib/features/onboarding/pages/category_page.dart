import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/features/onboarding/widgets/categories_widget.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'home_page_view_model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Color(0xFF1C0F0D),
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
