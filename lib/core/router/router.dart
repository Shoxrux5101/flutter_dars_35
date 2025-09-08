import 'package:go_router/go_router.dart';
import 'package:untitled3/core/router/routes.dart';
import 'package:untitled3/features/add_recipes/add_recipes.dart';
import 'package:untitled3/features/categories/pages/category_details_page.dart';
import 'package:untitled3/features/categories/pages/category_page.dart';
import 'package:untitled3/features/community/pages/community_page.dart';
import 'package:untitled3/features/forgot_password/page/forgot_password.dart';
import 'package:untitled3/features/onboarding/pages/onboarding_page.dart';
import 'package:untitled3/features/profile/pages/profile_page.dart';
import 'package:untitled3/features/trending_recipe/pages/trending_recipes_details.dart';
import '../../features/floating_menu_profile/pages/notification_page.dart';
import '../../features/floating_menu_profile/pages/settings.dart';
import '../../features/followers_page/pages/following_page.dart';
import '../../features/home_page/page/home_page.dart';
import '../../features/login_register/page/login.dart';
import '../../features/onboarding/pages/onboarding.dart';
import '../../features/recipes/pages/recipe_page.dart';
import '../../features/reviews/page/reviews_page.dart';
import '../../features/top_chefs/pages/top_chefs.dart';
import '../../features/trending_recipe/pages/trending_recipes.dart';
import '../../features/trending_recipe/pages/your_recipes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.communityPage,
    routes: [
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) {
          return Onboarding();
        },
      ),
      GoRoute(
        path: Routes.onboardingPage,
        builder: (context, state) {
          return OnboardingPage();
        },
      ),
      GoRoute(
        path: Routes.homePage,
        builder: (context, state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: Routes.categoryPage,
        builder: (context, state) {
          return CategoryPage();
        },
      ),
      GoRoute(
        path: Routes.recipePage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final id = extra['id'];
          return RecipePage(catId: id);
        },
      ),
      GoRoute(
        path: Routes.categoryDetailsPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final id = extra['id'];
          return CategoryDetailsPage(recipeId: id);
        },
      ),
      GoRoute(
        path: Routes.forgotPasswordPage,
        builder: (context, state) {
          return ForgotPassword();
        },
        // routes: [
        //   GoRoute(path: Routes.otpCoce,
        //   builder: (context, state) {
        //     return OTPCode();
        //   }),
        // ]
      ),
      GoRoute(
        path: Routes.loginPage,
        builder: (context, state) {
          return Login();
        },
      ),

      GoRoute(
        path: Routes.trendingPage,
        builder: (context, state) {
          return TrendingRecipes();
        },
      ),
      GoRoute(
        path: Routes.trendingRecipeDetailsPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final recipeId = extra['id'];
          return TrendingRecipesDetails(recipeId: recipeId);
        },
      ),
      GoRoute(
        path: Routes.yourRecipePage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final catId = extra['id'];
          return YourRecipes(
            catId: catId,
          );
        },
      ),
      GoRoute(
        path: Routes.chefsPage,
        builder: (context, state) {
          return TopChefs(
            ids: [],
          );
        },
      ),
      GoRoute(
        path: Routes.communityPage,
        builder: (context, state) {
          return CommunityPage();
        },
      ),
      GoRoute(
        path: Routes.reviewsPage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final id = extra?['id'];
          return ReviewsPage(id: id);
        },
      ),
      GoRoute(
        path: Routes.addRecipes,
        builder: (context, state) {
          return AddResipeisPage();
        },
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) {
          return ProfilePage();
        },
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) {
          return Settings();
        },
      ),
      GoRoute(
        path: Routes.notification,
        builder: (context, state) {
          return NotificationPage();
        },
      ),
      GoRoute(
        path: Routes.followers,
        builder: (context, state) {
          return FollowingPage();
        }
      ),
    ],
  );
}
