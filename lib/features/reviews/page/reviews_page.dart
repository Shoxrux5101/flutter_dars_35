import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../data/repository/reviews/repository/reviews_repository.dart';
import '../managers/reviews_view_model.dart';

class ReviewsPage extends StatefulWidget {
  final int recipeId;
  const ReviewsPage({super.key, required this.recipeId});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  late ReviewsViewModel vm;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm = context.read<ReviewsViewModel>();
      vm.loadReviews(widget.recipeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(
        repository: context.read<ReviewsRepository>(),
      ),
      child: Consumer<ReviewsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (vm.review == null) {
            return const Scaffold(
              body: Center(child: Text("Ma'lumot topilmadi", style: TextStyle(color: Colors.white))),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: ()=> context.pop(),
                icon: SvgPicture.asset('assets/icons/back-arrow.svg', color: AppColors.redPinkMain),
              ),
              title: Text('Reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.redPinkMain,
                  )
              ),
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 37,top: 30,bottom: 30),
                  width: double.infinity,
                  height: 223.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.redPinkMain,
                  ),
                  child: Row(
                    children: [
                      Image.network(vm.review!.photo),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
