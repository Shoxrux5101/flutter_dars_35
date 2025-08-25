import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/data/repository/reviews/repository/reviews_repository.dart';
import 'package:untitled3/features/reviews/managers/reviews_view_model.dart';

import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.recipeId});

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final vm = ReviewsViewModel(
          repository: ReviewsRepository(
            dioClient: ApiClient(
              interceptor: AuthInterceptor(
                secureStorage: FlutterSecureStorage(),
              ),
            ),
          ),
          recipeId: recipeId,
        );
        vm.loadReviews();
        return vm;
      },
      builder: (context, child) => Consumer<ReviewsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (vm.review == null) {
            return Center(
              child: Text(
                "Ma'lumotlar topilmadi",
                style: TextStyle(color: AppColors.white),
              ),
            );
          }

          final detail = vm.review!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset('assets/icons/back-arrow.svg'),

                color: AppColors.redPinkMain,
              ),
              title: Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.redPinkMain,
                ),
              ),
            ),
            body: Column(
              children: [
                Text(detail.title),
                Text(" ${detail.rating.toString()}"),
                Text("User: ${detail.user.username}"),
              ],
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        },
          ),
    );
  }
}
