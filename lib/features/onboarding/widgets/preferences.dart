import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/features/categories/managers/category_page_view_model.dart';
import '../../../core/utils/app_colors.dart';

class Preferences extends StatelessWidget {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryPageViewModel(),
      child: Consumer<CategoryPageViewModel>(
        builder: (context, vm, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text(
                  'Select your cuisines preferences',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Please select your cuisines preferences for better recommendations or you can skip it.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                if (vm.isCuisinesLoading)
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (vm.error != null)
                  Expanded(
                    child: Center(
                      child: Text(
                        'Error: ${vm.error}',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: GridView.builder(
                      itemCount: vm.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 6,
                        mainAxisExtent: 140,
                      ),
                      itemBuilder: (context, index) {
                        final item = vm.categories[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                item.image,
                                width: double.infinity,
                                height: 85.h,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: Colors.grey,
                                  width: double.infinity,
                                  height: 85.h,
                                  child: Icon(Icons.error, color: Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              item.title,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
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
