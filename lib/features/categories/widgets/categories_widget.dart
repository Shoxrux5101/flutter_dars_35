import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/router/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../managers/category_page_view_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryPageViewModel>(
      builder: (context, vm, child) => Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  context.push(Routes.recipePage,extra: {
                    'id' : vm.categories[index].id,
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.network(
                        vm.categories[index].image,
                        fit: BoxFit.cover,
                        width: 159.w,
                        height: 145.h,
                      ),
                    ),
                    Text(
                      vm.categories[index].title,
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: vm.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 31,
                mainAxisSpacing: 19,
                mainAxisExtent: 172.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
