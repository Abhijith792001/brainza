import 'package:brainza/Authentication/controller/auth_controller.dart';
import 'package:brainza/routes/app_routes.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/app_input_field.dart';
import 'package:brainza/widgets/app_primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
        child: Column(
          children: [
            SafeArea(
              maintainBottomViewPadding: true,
              minimum: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(LucideIcons.chevronLeft, color: AppTheme.whiteColor),
                  Text(
                    'Forgot your password ?',
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Image.asset('assets/images/brainza_logo_white.png', width: 120.w),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 40.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.sp),
                    topRight: Radius.circular(40.sp),
                  ),
                  color: AppTheme.whiteColor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Sign in to your account!',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.grayColor,
                        ),
                      ),

                      SizedBox(height: 20.h),
                      AppInputField(
                        controller: controller,
                        hintText: "Enter Your Email",
                        prefixIcon: LucideIcons.mail,
                        inputController: controller.emailController,
                        obscureText: false,
                      ),
                      SizedBox(height: 20.h),
                      Obx(
                        () => AppInputField(
                          controller: controller,
                          hintText: "Enter Your Password",
                          prefixIcon: LucideIcons.lock,
                          inputController: controller.passwordController,
                          obscureText: controller.isShow.value,
                          isPassword: true,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      InkWell(
                        onTap: () {
                          if (!controller.isLoading.value) {
                            controller.loginUser();
                          }
                        },
                        child: AppPrimaryButton(btnName: 'Login'),
                      ),
                      // ElevatedButton(
                      //   onPressed:
                      //       controller.isLoading.value
                      //           ? null
                      //           : controller.loginUser,
                      //   child:
                      //       controller.isLoading.value
                      //           ? CircularProgressIndicator(color: Colors.white)
                      //           : Text('Login'),
                      // ),

                      Text.rich(
                        TextSpan(
                          text: "Don't have account?  ",
                          children: <InlineSpan>[
                            TextSpan(
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap =
                                        () =>
                                            Get.toNamed(AppRoutes.registerPage),
                              text: 'Sign Up',
                              style: TextStyle(color: AppTheme.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.sp),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.sp),
                          ),
                          color: AppTheme.whiteColor,
                          boxShadow: AppTheme.primaryShadow,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/g.png', width: 24),
                            SizedBox(width: 10.w),
                            Text(
                              'Sign with google',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
