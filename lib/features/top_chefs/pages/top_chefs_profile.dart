import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:untitled3/features/top_chefs/widgets/top_chefs_profile_app_bar.dart';
import '../../../core/authInterceptor.dart';
import '../../../core/network/api_client.dart';
import '../../../data/models/chefs_model.dart';
import '../../../data/repository/chefs/top_chefs_profile_repository.dart';
import '../managers/top_chefs_profile_view_model.dart';
import '../widgets/top_chefs_profile_header.dart';
import '../widgets/top_chefs_profile_grid.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TopChefsProfile extends StatelessWidget {
  final ChefsModel chefsModel;

  const TopChefsProfile({super.key, required this.chefsModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopChefsProfileViewModel(
        repository: TopChefsProfileRepository(
          dioClient: ApiClient(
            interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()),
          ),
        ),
      )..fetchChefsRecipes(chefsModel.id),
      child: Consumer<TopChefsProfileViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (vm.errorMessage != null) {
            return Scaffold(body: Center(child: Text(vm.errorMessage!)));
          }
          return Scaffold(
            backgroundColor: Color(0xFF1C0F0D),
            extendBody: true,
            appBar: TopChefsProfileAppBar(chefsModel: chefsModel),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Column(
                children: [
                  TopChefsProfileHeader(chefsModel: chefsModel),
                  SizedBox(height: 13.h),
                  Text(
                    "Recipes",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: Colors.red,
                  ),
                  SizedBox(height: 15.h),
                  TopChefsProfileGrid(recipes: vm.recipes),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        },
      ),
    );
  }
}
