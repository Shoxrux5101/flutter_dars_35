import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

class SearchFilterDialog extends StatefulWidget {
  const SearchFilterDialog({super.key});

  @override
  State<SearchFilterDialog> createState() => _SearchFilterDialogState();
}

class _SearchFilterDialogState extends State<SearchFilterDialog> {
  final List<String> recipes = [
    "Ceviche",
    "Hamburger",
    "Egg Rolls",
    "Wraps",
    "Cheesecake",
    "Tomatoe Soup",
    "Parfait",
    "Vegan",
    "Baked Salmon",
  ];

  final Set<String> selected = {};

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  filled: true,
                  fillColor: AppColors.pink,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended Recipes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: recipes.map((recipe) {
                  final isSelected = selected.contains(recipe);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selected.remove(recipe);
                        } else {
                          selected.add(recipe);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.redPinkMain : AppColors.pink,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        recipe,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.redPinkMain,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Icon(Icons.add_circle, color: AppColors.pink),
                  SizedBox(width: 8.w),
                  Text("Add Allergies"),
                ],
              ),

              SizedBox(height: 20.h),

              SizedBox(
                width: 207,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.redPinkMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  onPressed: () {
                    Navigator.pop(context, selected.toList());
                  },
                  child: Text("Search",style: TextStyle(color: AppColors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
