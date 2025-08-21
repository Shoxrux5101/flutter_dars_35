import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/dependencies.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/router/router.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'core/authInterceptor.dart';
import 'data/repository/authentication/repository/authentication_repository.dart';
import 'data/repository/categories/repository/category_repository.dart';
import 'data/repository/chefs/repository/top_chefs_profile_repository.dart';
import 'data/repository/recipes/repository/recipe_repository.dart';
import 'data/repository/reviews/repository/reviews_repository.dart';

void main() {
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
        child:MultiProvider(
            providers:[
              Provider(create: (context) => FlutterSecureStorage()),
              Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
              Provider(create: (context) => ApiClient(interceptor: context.read())),
              Provider(create: (context) => AuthenticationRepository(dioClient: context.read<ApiClient>(),),),
              Provider(create: (context) =>RecipesRepository(dioClient: context.read<ApiClient>()),),
              //Provider(create: (context) =>CategoryRepository(dioClient: context.read<ApiClient>(),),),
              // Provider(create: (context) =>ReviewsRepository(dioClient: context.read<ApiClient>(),),),
              Provider(create: (context) => TopChefsProfileRepository(dioClient: context.read(),),),
            ],
            //dependencies,
        child: MaterialApp.router(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.beige),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
        ),
    );
  }
}
