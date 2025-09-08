import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/router/router.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/data/models/category_model.dart';
import 'package:untitled3/data/repository/categories/category_repository_local.dart';
import 'package:untitled3/data/repository/categories/category_repository_remote.dart';
import 'package:untitled3/data/repository/community/community_repository.dart';
import 'package:untitled3/data/repository/following/following_repository.dart';
import 'package:untitled3/data/repository/login/login_repository.dart';
import 'package:untitled3/data/repository/onboarding/onboarding_repository.dart';
import 'package:untitled3/data/repository/profile/profile_repository.dart';
import 'core/authInterceptor.dart';
import 'data/repository/authentication/authentication_repository.dart';
import 'data/repository/categories/category_repository.dart';
import 'data/repository/chefs/chefs_repository.dart';
import 'data/repository/chefs/top_chefs_profile_repository.dart';
import 'data/repository/recipes/recipe_repository.dart';
import 'data/repository/reviews/reviews_repository.dart';
import 'data/repository/trending_recipes/trending_recipes_repository.dart';
import 'features/trending_recipe/managers/trending_recipes_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox<CategoryModel>('categories');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MultiProvider(
        providers: [
          Provider(create: (context) => const FlutterSecureStorage()),
          Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
          Provider(create: (context) => ApiClient(interceptor: context.read())),
          Provider(create: (context) => AuthenticationRepository(dioClient: context.read<ApiClient>())),
          Provider(create: (context) => OnboardingRepository(apiClient: context.read<ApiClient>())),
          Provider(create: (context) => ReviewsRepository(context.read<ApiClient>())),
          Provider(create: (context) => CategoryRepository(apiClient: context.read<ApiClient>())),
          Provider(create: (context) => TopChefsProfileRepository(apiClient: context.read())),
          Provider(create: (context) => TrendingRecipesRepository(apiClient: context.read<ApiClient>())),
          Provider(create: (context) => LoginRepository(apiClient: context.read<ApiClient>())),
          Provider(create: (context) => ProfileRepository(apiClient: context.read<ApiClient>())),
          Provider(create: (context) => CommunityRepository(apiClient: context.read<ApiClient>())),
          Provider(create: (context) => RecipesRepository(apiClient: context.read<ApiClient>())),
          Provider(create: (context) => FollowingRepository(apiClient: context.read<ApiClient>())),
          ChangeNotifierProvider(
            create: (context) => TrendingRecipesViewModel(
              repository: context.read<TrendingRecipesRepository>(),
            )..fetchTrendingRecipes(),
          ),
          Provider(
            create: (_) => ChefsRepository(
              dioClient: ApiClient(
                interceptor: AuthInterceptor(
                  secureStorage: FlutterSecureStorage(),
                ),
              ),
            ),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.beige,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
            ),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
