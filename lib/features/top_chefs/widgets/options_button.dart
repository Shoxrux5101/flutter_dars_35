import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/data/models/chefs_model.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_toggle.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key, required this.chefsModel});
  final ChefsModel chefsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24),
      child: CircleAvatar(
        backgroundColor: AppColors.pink,
        radius: 20,
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 56.w, vertical: 45.h),
                width: double.infinity,
                height: 373.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: AppColors.white,
                ),
                child: Column(
                  spacing: 17.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 15.w,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000.r),
                          child: Image.network(
                            chefsModel.profilePhoto,
                            width: 64.w,
                            height: 64.h,
                          ),
                        ),
                        Text(
                          '@${chefsModel.userName}',
                          style:  TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.redPinkMain,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Manage Notifications',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mute Notifications',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        CustomToggle(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mute Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        CustomToggle(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Block Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        CustomToggle(),
                      ],
                    ),
                    Text(
                      'Report',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          icon: SvgPicture.asset(
            'assets/icons/three_dots.svg',
            color: AppColors.redPinkMain,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
