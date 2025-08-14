import 'package:go_router/go_router.dart';
import 'package:untitled3/core/router/router_name.dart';
import 'package:untitled3/features/categories/pages/category_details_page.dart';
import 'package:untitled3/features/categories/pages/category_page.dart';
import 'package:untitled3/features/forgot_password/page/forgot_password.dart';
import 'package:untitled3/features/onboarding/pages/onboarding_page.dart';
import '../../features/login_register/page/login.dart';
import '../../features/recipes/pages/recipe_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouterName.loginPage,
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
      GoRoute(path: RouterName.loginPage,
        builder: (context, state) {
        return Login();
        }
      ),
    ],
  );
}
