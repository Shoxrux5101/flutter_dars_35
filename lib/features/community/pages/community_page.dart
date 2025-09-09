import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/core/widgets/like_botton.dart';
import 'package:untitled3/features/community/widget/community_app_bar.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../data/repository/community/community_repository.dart';
import '../managers/community_view_model.dart';
import '../../categories/pages/category_details_page.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(
        CommunityRepository(
          apiClient: ApiClient(
            interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()),
          ),
        ),
      )..getCommunity(),
      builder: (context, child) => Consumer<CommunityViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (vm.errorMessage != null) {
            return Scaffold(
              body: Center(child: Text('Error: ${vm.errorMessage}')),
            );
          }
          if (vm.recipes.isEmpty) {
            return Scaffold(
              body: Center(child: Text("No recipes found")),
            );
          }
          return Scaffold(
            extendBody: true,
            appBar: CommunityAppBar(),
            body: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 22.h),
              itemCount: vm.recipes.length,
              itemBuilder: (context, index) {
                final items = vm.recipes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailsPage(recipeId: items.id),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 22.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(17.r),
                              child: Image.network(
                                items.user.profilePhoto,
                                width: 35.w,
                                height: 35.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@${items.user.username}',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${items.created.month} Month ago',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 22.h),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                              child: Image.network(
                                items.photo,
                                width: double.infinity,
                                height: 173.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 15.w,
                              top: 15.h,
                              child: LikeButton(),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            color: AppColors.redPinkMain,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(14.r),
                              bottomLeft: Radius.circular(14.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        items.title,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    SvgPicture.asset(
                                      "assets/icons/star.svg",
                                      color: AppColors.white,
                                      width: 10.w,
                                    ),
                                    Text(
                                      items.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        items.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/clock.svg",
                                              color: AppColors.white,
                                              width: 10.w,
                                            ),
                                            SizedBox(width: 3.w),
                                            Text(
                                              '${items.timeRequired} min',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          children: [
                                            Text(
                                              items.reviewsCount.toString(),
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            SizedBox(width: 3.w),
                                            SvgPicture.asset(
                                              "assets/icons/reviews.svg",
                                              color: AppColors.white,
                                              width: 10.w,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 14.h),
                        Container(
                          width: double.infinity,
                          height: 1.h,
                          color: AppColors.pinkSub,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        },
      ),
    );
  }
}
