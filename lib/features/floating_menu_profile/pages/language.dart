import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage;

  final List<String> languages = [
    'English',
    'French',
    'Germany',
    'Italian',
    'Korean',
    'Hindi',
    'Arabic',
    'Russia',
    'Spanish',
    'Gujarati',
    'Bengali',
    'Hebrew',
    'Urdu',
    'Ukrainian',
    'Dutch'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/back-arrow.svg'),
        ),
        centerTitle: true,
        title: Text(
          "Language",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              'Select your preferred language',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                itemCount: languages.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 1,
                  height: 1.h,
                ),
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      language,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    trailing: _selectedLanguage == language
                        ? Icon(
                      Icons.check_circle,
                      color: const Color(0xFFE94560),
                      size: 24.sp,
                    )
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedLanguage = language;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedLanguage != null
                    ? () {
                  Navigator.pop(context, _selectedLanguage);
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE94560),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}