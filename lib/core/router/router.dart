import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/core/router/router_name.dart';
import 'package:untitled3/features/onboarding/pages/category_details_page.dart';
import 'package:untitled3/features/onboarding/pages/category_page.dart';
import 'package:untitled3/features/onboarding/pages/onboarding_page.dart';
import 'package:untitled3/features/onboarding/pages/recipe_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouterName.onboardingPage,
    routes: [
      GoRoute(
        path: RouterName.onboardingPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final id = extra?['id'];
          return OnboardingPage();
        },
      ),
      GoRoute(
        path: RouterName.categoryPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final id = extra?['id'];
          return CategoryPage();
        },
      ),
      GoRoute(
        path: RouterName.recipePage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final id = extra['id'];
          return RecipePage(catId:id);
        },
      ),
      GoRoute(
        path: RouterName.categoryDetailsPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final id = extra['id'];
          return CategoryDetailsPage(recipeId:id);
        },
      ),
    ],
  );
}
