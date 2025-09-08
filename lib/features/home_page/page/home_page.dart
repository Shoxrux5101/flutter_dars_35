import 'package:flutter/material.dart';
import 'package:untitled3/core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:untitled3/features/home_page/widgets/home_page_app_bar.dart';
import 'package:untitled3/features/home_page/widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomePageAppBar(),
      body: HomePageWidgets(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
