import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/features/login_register/page/sign_up.dart';
import 'package:untitled3/features/login_register/widgets/email_input_field.dart';
import 'package:untitled3/features/login_register/widgets/password_input_field.dart';
import '../../../core/authInterceptor.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/repository/authentication/repository/authentication_repository.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authRepo = AuthenticationRepository(dioClient: ApiClient(interceptor: AuthInterceptor(
    secureStorage: const FlutterSecureStorage(),
  ),));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Login',
          style: TextStyle(
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 130.h),
              EmailInput(
                text: 'Email',
                hintText: "example@example.com",
                controller: emailController,
              ),
              SizedBox(height: 10.h),
              PasswordInputField(
                text: 'Password',
                controller: passwordController,
              ),
              SizedBox(height: 89.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('email va parol kiriting')),
                        );
                        print(email);
                        return;
                      }
                      final result = await authRepo.login(email, password);

                      if (result != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("login muvaffaqiyatli bo'ldi")),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('xatolik')),
                        );
                      }
                    },
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
                            'Log In',
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
                  SizedBox(height: 27.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
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
                  SizedBox(height: 59.h,),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 75.h,
                  ),
                  Column(
                    spacing: 20.h,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('or sign up with',
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,color: AppColors.white,),
                      ),
                      Row(
                        spacing: 13.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset('assets/Capa_1.png'),
                        Image.asset('assets/google.png'),
                        Image.asset('assets/facebook.png'),
                        Image.asset('assets/whatsap.png'),
                      ],),
                      Text('Don’t have an account? Sign Up',
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,color: AppColors.white,),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
