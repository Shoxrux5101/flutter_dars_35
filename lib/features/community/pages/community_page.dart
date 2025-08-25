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
import '../widget/community_bottom_app_bar.dart';

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
          ApiClient(
            interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()),
          ),
        ),
      ),
      builder: (context, child) => Consumer<CommunityViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.recipes.isEmpty) {
            return Center(child: Text("No recipes found"));
          }
          return Scaffold(
            appBar: CommunityAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 36.w, left: 36.w),
                child: Column(
                  children: [
                    SizedBox(height: 22.h),
                    ...List.generate(vm.recipes.length, (index) {
                      final items = vm.recipes[index];
                      return SizedBox(
                        width: 356.w,
                        height: 320.h,
                        child: Column(
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
                                SizedBox(width: 14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@${items.user.username}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Text(
                                      '${items.created.month} Month ago',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        items.photo,
                                        width: double.infinity,
                                        height: 173.h,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 5,
                                        child: LikeButton(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 356.w,
                                  height: 79.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.redPinkMain,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 0,
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                items.title,
                                                style: TextStyle(
                                                  fontSize: 15,
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
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 258.w,
                                              height: 45.h,
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
                                            Column(
                                              crossAxisAlignment:CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/clock.svg",
                                                      color: AppColors.white,
                                                      width: 10,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      '${items.timeRequired} min',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      items.reviewsCount
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                    SizedBox(width: 3),
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.h,
                              color: AppColors.pinkSub,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        },
      ),
    );
  }
}
