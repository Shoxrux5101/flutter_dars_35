import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/data/repository/profile/profile_repository.dart';
import 'package:untitled3/data/repository/recipes/recipe_repository.dart';
import '../../../core/network/api_client.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../managers/favourite_view_model.dart';
import '../managers/profile_view_model.dart';
import '../widgets/profile_header_delegate.dart';
import '../widgets/recipe_detail_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(
            profileRepository: ProfileRepository(
              apiClient: ApiClient(
                interceptor: AuthInterceptor(
                  secureStorage: FlutterSecureStorage(),
                ),
              ),
            ),
          )..fetchProfile(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteViewModel(
            repository: context.read<RecipesRepository>(),
          ),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: const BottomNavigation(),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Consumer<ProfileViewModel>(
              builder: (context, vm, child) {
                if (vm.isLoading || vm.profile == null) {
                  return AppBar();
                }
                return AppBar(
                  title: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Image.network(
                          vm.profile!.profilePhoto,
                          width: 102.w,
                          height: 97.h,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${vm.profile!.firstName} ${vm.profile!.lastName}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.redPinkMain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 46.w),
                            child: Text(
                              vm.profile!.username,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColors.pinkSub,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => Routes.addRecipes,
                      icon: SvgPicture.asset('assets/icons/Add Recipe.svg'),
                    ),
                    IconButton(
                      onPressed: () => Routes.settings,
                      icon: SvgPicture.asset(
                          'assets/icons/Configuration Button.svg'),
                    ),
                  ],
                );
              },
            ),
          ),
          body: Consumer<ProfileViewModel>(
            builder: (context, vm, child) {
              if (vm.isLoading) {
                return  Center(child: Text("Yuklanmoqda...",style: TextStyle(color: AppColors.white),));
              }
              if (vm.error != null) {
                return Center(child: Text("Xato",style: TextStyle(color: AppColors.white),));
              }
              if (vm.profile == null) {
                return Center(child: Text("Profile topilmadi",style: TextStyle(color: AppColors.white),));
              }
              final profile = vm.profile!;

              return CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: ProfileHeaderDelegate(profile: profile),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              width: 356.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppColors.pink,
                                  width: 1.w,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '      ${profile.recipesCount}\n Retseptlar',
                                    style:
                                    TextStyle(color: AppColors.redPinkMain),
                                  ),
                                  Container(
                                    width: 2.w,
                                    height: 26.h,
                                    color: AppColors.pink,
                                  ),
                                  Text(
                                    '       ${profile.followerCount}\n Follower',
                                    style:
                                    TextStyle(color: AppColors.redPinkMain),
                                  ),
                                  Container(
                                    width: 2.w,
                                    height: 26.h,
                                    color: AppColors.pink,
                                  ),
                                  Text(
                                    '         ${profile.followingCount}\n Following ',
                                    style:
                                    TextStyle(color: AppColors.redPinkMain),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            const RecipeDetailWidget(),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}