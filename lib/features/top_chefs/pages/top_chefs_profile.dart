import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:untitled3/core/widgets/custom_toggle.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/authInterceptor.dart';
import '../../../core/network/api_client.dart';
import '../../../data/models/chefs_model.dart';
import '../../../data/repository/chefs/repository/top_chefs_profile_repository.dart';
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  'assets/icons/back-arrow.svg',
                  color: AppColors.redPinkMain,
                ),
              ),
              title: Center(
                child: Text(
                  chefsModel.userName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.redPinkMain,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.pink,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 56.w,vertical: 45.h),
                                width: double.infinity,
                                height: 253.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  spacing: 17.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      spacing: 15.w,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(1000.r),
                                          child:
                                          Image.network(chefsModel.profilePhoto,width: 64.w,height: 64.h,),
                                        ),
                                        Text('@${chefsModel.userName}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.redPinkMain,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Copy Profile URL',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text('Share this Profile',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/share.svg',
                            color: AppColors.redPinkMain,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.pink,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 56.w,vertical: 45.h),
                                width: double.infinity,
                                height: 373.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  spacing: 17.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      spacing: 15.w,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(1000.r),
                                          child:
                                        Image.network(chefsModel.profilePhoto,width: 64.w,height: 64.h,),
                                        ),
                                        Text('@${chefsModel.userName}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.redPinkMain,
                                        ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Manage Notifications',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Mute Notifications',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                        CustomToggle(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Mute Account',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                        CustomToggle(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Block Account',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                        CustomToggle(),
                                      ],
                                    ),
                                    Text('Report',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/three_dots.svg',
                            color: AppColors.redPinkMain,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
