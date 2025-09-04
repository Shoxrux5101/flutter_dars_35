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
import '../../../core/widgets/custom_app_bar.dart';
import '../managers/favourite_view_model.dart';
import '../managers/profile_view_model.dart';
import '../widgets/recipe_detail_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(
            profileRepository: ProfileRepository(apiClient: ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))),
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
          bottomNavigationBar: BottomNavigation(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Consumer<ProfileViewModel>(
              builder: (context, vm, child) {
                return AppBar(
                  title: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Image.network(vm.profile!.profilePhoto,width: 102.w,height: 97.h,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${vm.profile!.firstName} ${vm.profile!.lastName}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color:AppColors.redPinkMain,),),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 46.w),
                            child: Text(vm.profile!.username,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.pinkSub,),),
                          ),

                        ],
                      ),
                      
                    ],
                  ),
                  actions: [
                    IconButton(onPressed: (){Routes.addRecipes;}, icon: SvgPicture.asset('assets/icons/Add Recipe.svg',),),
                    IconButton(onPressed: (){
                      Routes.settings;
                    }, icon: SvgPicture.asset('assets/icons/Configuration Button.svg',),),
                  ],
                );
              },
            ),
          ),
          body: Consumer<ProfileViewModel>(
            builder: (context, vm, child) {
              if (vm.isLoading) return const Center(child: CircularProgressIndicator());
              if (vm.error != null) return Center(child: Text("Xato: ${vm.error}"));
              if (vm.profile == null) return const Center(child: Text("Profile topilmadi"));

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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '      ${profile.recipesCount}\n Retseptlar',
                                    style: TextStyle(color: AppColors.redPinkMain),
                                  ),
                                  Container(
                                    width: 2.w,
                                    height: 26.h,
                                    color: AppColors.pink,
                                  ),
                                  Text(
                                    '       ${profile.followerCount}\n Follower',
                                    style: TextStyle(color: AppColors.redPinkMain),
                                  ),
                                  Container(
                                    width: 2.w,
                                    height: 26.h,
                                    color: AppColors.pink,
                                  ),
                                  Text(
                                    '         ${profile.followingCount}\n Following ',
                                    style: TextStyle(color: AppColors.redPinkMain),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            RecipeDetailWidget(),
                          ],
                        ),
                      ),
                    ],
                    ),
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
class ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  final dynamic profile;

  ProfileHeaderDelegate({required this.profile});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Container(
      height: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
      color: Theme.of(context).colorScheme.surfaceContainer,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 100 - (50 * percent),
            height: 100 - (50 * percent),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: profile.profilePhoto.isNotEmpty
                  ? Image.network(
                profile.profilePhoto,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.person, size: 50),
              )
                  : Icon(Icons.person, size: 50),
            ),
          ),

          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 20 - (5 * percent),
                    fontWeight: FontWeight.bold,
                    color: AppColors.redPinkMain,
                  ),
                  child: Text(profile.username),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: 1 - percent,
                  child: Text(
                    "@${profile.username}",
                    style: TextStyle(color: AppColors.redPinkMain),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: 1 - percent,
                  child: Text(
                    profile.presentation,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  double get maxExtent => 160.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}