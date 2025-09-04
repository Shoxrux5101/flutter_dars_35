import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/authInterceptor.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../data/repository/reviews/reviews_repository.dart';
import '../managers/reviews_view_model.dart';
import '../widget/rating_stars.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(
        repository: ReviewsRepository(
          ApiClient(
            interceptor: AuthInterceptor(
              secureStorage: FlutterSecureStorage(),
            ),
          ),
        ),
        id: id,
      ),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: AppColors.beige,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPicture.asset("assets/icons/back-arrow.svg"),
          ),
          centerTitle: true,
          title: Text(
            'Reviews',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.redPinkMain,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation(),
        body: Consumer<ReviewsViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (vm.errorMessage != null) {
              return Center(child: Text("Error: ${vm.errorMessage}",style: TextStyle(color: AppColors.white),));
            }
            if (vm.recipeData == null) {
              return Center(child: Text("No data"));
            }
            final detail = vm.recipeData!;
            final int rating = (detail['rating'] as num).toInt();
            final int reviewsCount = (detail['reviewsCount'] as num).toInt();
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 224.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.redPinkMain,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.network(
                          detail['photo'],
                          width: 162.w,
                          height: 162.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 210.w,
                        height: 132.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              detail['title'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                RatingStars(rating: rating),
                                SizedBox(width: 5.w),
                                Text(
                                  "($reviewsCount Reviews)",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    17.r,
                                  ),
                                  child: Image.network(
                                    detail['user']['profilePhoto'],
                                    width: 33.w,
                                    height: 33.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@${detail['user']['username']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          detail['user']['firstName'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        Text(
                                          maxLines: 1,
                                          ' ${detail['user']['lastName']} - Chef',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => LeaveReviewPage(
                                //       id: vm.id,
                                //     ),
                                //   ),
                                // );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 126.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20.r,
                                  ),
                                  color: AppColors.white,
                                ),
                                child: Text(
                                  'Add Review',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.redPinkMain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comments',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.redPinkMain,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}