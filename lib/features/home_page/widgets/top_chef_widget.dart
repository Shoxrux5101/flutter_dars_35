import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../top_chefs/managers/top_chefs_view_model.dart';

class TopChefWidget extends StatefulWidget {
  final List<dynamic> jsonData;


  const TopChefWidget({super.key, required this.jsonData});

  @override
  State<TopChefWidget> createState() => _TopChefWidgetState();
}
class _TopChefWidgetState extends State<TopChefWidget> {
  late TopChefsViewModel vm;


  @override
  void initState() {
    super.initState();
    vm = TopChefsViewModel(repository: context.read());
    vm.fetchTopViewedChefs(widget.jsonData.cast<int>());
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopChefsViewModel>.value(
      value: vm,
      child: Consumer<TopChefsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.errorMessage != null) {
            return Center(child: Text('Error: ${vm.errorMessage}'));
          }
          if(vm.topChefs.isEmpty){
            return Center(child: Text("chefs list bo'sh kelyapti",style: TextStyle(color: AppColors.white),),);
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 19.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Chef',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redPinkMain,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 110.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.topChefs.length,
                    itemBuilder: (context, index) {
                      final chef = vm.topChefs[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 9.w),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                chef.profilePhoto,
                                width: 83.w,
                                height: 74.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              chef.firstName,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
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