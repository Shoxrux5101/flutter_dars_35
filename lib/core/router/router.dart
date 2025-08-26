import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/core/router/router_name.dart';
import 'package:untitled3/features/categories/pages/category_details_page.dart';
import 'package:untitled3/features/categories/pages/category_page.dart';
import 'package:untitled3/features/community/pages/community_page.dart';
import 'package:untitled3/features/forgot_password/page/forgot_password.dart';
import 'package:untitled3/features/onboarding/pages/onboarding_page.dart';
import '../../features/login_register/page/login.dart';
import '../../features/recipes/pages/recipe_page.dart';
import '../../features/reviews/page/reviews_page.dart';
import '../../features/top_chefs/pages/top_chefs.dart';
import '../../features/trending_recipe/pages/trending_recipes.dart';
import '../../features/trending_recipe/pages/your_recipes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouterName.chefsPage,
    routes: [
      GoRoute(
        path: RouterName.onboardingPage,
        builder: (context, state) {
          return OnboardingPage();
        },
      ),
      GoRoute(
        path: RouterName.categoryPage,
        builder: (context, state) {
          return CategoryPage();
        },
      ),
      GoRoute(
        path: RouterName.recipePage,
        builder: (context, state) {
          final id = state.extra;
          if (id == null || id is! int) {
            return Scaffold(
              body: Center(child: Text("Category id not provided")),
            );
          }
          return RecipePage(catId: id);
        },
      ),
      GoRoute(
        path: RouterName.categoryDetailsPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final id = extra['id'];
          return CategoryDetailsPage(recipeId: id);
        },
      ),
      GoRoute(
        path: RouterName.forgotPasswordPage,
        builder: (context, state) {
          return ForgotPassword();
        },
        // routes: [
        //   GoRoute(path: RouterName.otpCoce,
        //   builder: (context, state) {
        //     return OTPCode();
        //   }),
        // ]
      ),
      GoRoute(
        path: RouterName.loginPage,
        builder: (context, state) {
          return Login();
        },
      ),

      GoRoute(
        path: RouterName.trendingPage,
        builder: (context, state) {
          return TrendingRecipes();
        },
      ),
      GoRoute(
        path: RouterName.yourRecipePage,
        builder: (context, state) {
          return YourRecipes();
        },
      ),
      GoRoute(
        path: RouterName.chefsPage,
        builder: (context, state) {
          return TopChefs( ids: [],);
        },
      ),
      GoRoute(
        path: RouterName.communityPage,
        builder: (context, state) {
          return CommunityPage();
        },
      ),
      GoRoute(
        path: RouterName.reviewsPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final recipeId = extra?['id'] ?? 0;
          return ReviewsPage(recipeId: recipeId);
        },
      ),
    ],
  );
}
