import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/login_register/widgets/date_input_field.dart';
import 'package:untitled3/features/login_register/widgets/email_input_field.dart';
import 'package:untitled3/features/login_register/widgets/mobile_number.dart';
import 'package:untitled3/features/login_register/widgets/password_input_field.dart';
import '../../../core/utils/app_colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Sign Up',
          style: TextStyle(color: AppColors.redPinkMain),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.h),
        child: Column(
          spacing: 5.h,
          children: [
            SizedBox(height: 80.h,),
            EmailInput(
              text: 'Full Name',
              hintText: 'John Doe',
              controller: fullNameController,
            ),
            EmailInput(
              text: 'Email',
              hintText: 'example@example.com',
              controller: emailController,
            ),
            MobileNumber(
              text: 'Mobile Number',
              hintText: '+ 123 456 789',
              controller: mobileController,
            ),
            DateInputField(
              text: 'Date Of Birth',
              hintText: 'DD/MM/YYYY',
              controller: dobController,
            ),
            PasswordInputField(
              text: 'Password',
              controller: passwordController,
            ),
            PasswordInputField(
              text: 'Confirm Password',
              controller: confirmPasswordController,
            ),
            SizedBox(height: 40.h,),
            Text('By continuing, you agree to \nTerms of Use and Privacy Policy',style:
              TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.white,)
              ),
            SizedBox(height: 12.h,),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  width: 207.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pinkSub,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white,
                ),),
                Text('Log In',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.redPinkMain,
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
