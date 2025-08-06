import 'package:flutter/material.dart';
import 'package:untitled3/core/widgets/bottom_navigation_bar/bottom_navigation_bar_gradient.dart';
import 'bottom_navigation_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BottomNavigationBarMain(),
        BottomNavigationBarGradient()
      ],
    );
  }
}
