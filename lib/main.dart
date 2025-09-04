import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/router/router.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'core/authInterceptor.dart';
import 'core/dependencies.dart';
import 'data/repository/authentication/authentication_repository.dart';
import 'data/repository/categories/category_repository.dart';
import 'data/repository/chefs/top_chefs_profile_repository.dart';
import 'data/repository/recipes/recipe_repository.dart';
import 'data/repository/reviews/reviews_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: [
          Provider(create: (context) => FlutterSecureStorage()),
          Provider(
            create: (context) => AuthInterceptor(secureStorage: context.read()),
          ),
          Provider(create: (context) => ApiClient(interceptor: context.read())),
          Provider(
            create: (context) => AuthenticationRepository(
              dioClient: context.read<ApiClient>(),
            ),
          ),
          Provider(
            create: (context) =>
                RecipesRepository(dioClient: context.read<ApiClient>()),
          ),
          Provider(
            create: (context) => ReviewsRepository(
              context.read<ApiClient>(),
            ),
          ),
          Provider(
            create: (context) => CategoryRepository(
              dioClient: context.read<ApiClient>(),
            ),
          ),
          Provider(
            create: (context) => TopChefsProfileRepository(
              dioClient: context.read(),
            ),
          ),
        ],
        //providers: dependencies,
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.beige,
            appBarTheme: AppBarTheme(
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
