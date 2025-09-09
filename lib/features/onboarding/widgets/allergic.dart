import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/network/api_client.dart';
import '../../../data/repository/onboarding/allergic_repository.dart';
import '../managers/allergic_view_model.dart';

class Allergic extends StatelessWidget {
  const Allergic({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AllergyViewModel(
        repository: AllergyRepository(apiClient: ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))),
      )..loadAllergies(),
      child: Consumer<AllergyViewModel>(
        builder: (context, vm, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text(
                  '¿You have any allergic?',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                if (vm.loading)
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (vm.error != null)
                  Expanded(
                    child: Center(
                      child: Text(
                        'Error: ${vm.error}',
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: GridView.builder(
                      itemCount: vm.items.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 122,
                      ),
                      itemBuilder: (context, index) {
                        final item = vm.items[index];
                        final selected = vm.isSelected(item.id);

                        return GestureDetector(
                          onTap: () => vm.toggleSelected(item.id),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      item.image,
                                      width: double.infinity,
                                      height: 85.h,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Container(
                                        color: Colors.grey,
                                        width: double.infinity,
                                        height: 85.h,
                                        child: const Icon(Icons.error, color: Colors.red),
                                      ),
                                    ),
                                    if (selected)
                                      Container(
                                        width: double.infinity,
                                        height: 85.h,
                                        color: Colors.black45,
                                        child: const Icon(Icons.check, color: Colors.white),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                item.title,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
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
