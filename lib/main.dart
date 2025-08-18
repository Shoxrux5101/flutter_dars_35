import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/dependencies.dart';
import 'package:untitled3/core/router/router.dart';
import 'package:untitled3/core/utils/app_colors.dart';

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
            providers: dependencies,
        child: MaterialApp.router(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.beige),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
        ),
    );
  }
}
