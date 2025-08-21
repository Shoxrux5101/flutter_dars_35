import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import '../../trending_recipe/widgets/followButton.dart';
import '../../../data/models/chefs_model.dart';
import '../pages/top_chefs_profile.dart';

class NewChefs extends StatelessWidget {
  final List<ChefsModel> chefs;

  const NewChefs({super.key, required this.chefs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 9.h,
        left: 36.w,
        right: 36.w,
        bottom: 18.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Chefs',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.redPinkMain,
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 223.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: chefs.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                final chef = chefs[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>TopChefsProfile(chefsModel: chef,))
                    );
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14.r),
                                bottomRight: Radius.circular(14.r),
                              ),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.all(10),
                            width: 160.w,
                            height: 76.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${chef.lastName} ${chef.firstName} -Chef',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '@${chef.userName}',
                                  style: TextStyle(
                                    color: AppColors.pink,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Text(
                                      '${chef.recipesCount}',
                                      style: TextStyle(color: AppColors.pink),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/star.svg',
                                      color: AppColors.pink,
                                    ),
                                    SizedBox(width: 45.w),
                                    Row(
                                      spacing: 10,
                                      children: [
                                        FollowButton(
                                          width: 43.w,
                                          height: 14.h,
                                          textSize: 8,
                                        ),
                                        Container(
                                          width: 14.w,
                                          height: 14.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(6),
                                            color: AppColors.redPinkMain,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: SvgPicture.asset(
                                              'assets/icons/share.svg',
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          chef.profilePhoto,
                          height: 153.h,
                          width: 170.w,
                          fit: BoxFit.cover,
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
  }
}
