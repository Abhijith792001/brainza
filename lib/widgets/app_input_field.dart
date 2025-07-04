import 'package:brainza/Authentication/controller/auth_controller.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AppInputField extends StatelessWidget {
  AppInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.inputController,
    this.isPassword,
    this.obscureText
  });

  final AuthController controller;

  final String hintText;
  final IconData prefixIcon;
  bool? isPassword = false;
  bool? obscureText = false;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        boxShadow: AppTheme.primaryShadow,
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(13.sp)),
      ),
      child: Row(
          children: [
            Icon(prefixIcon, color: AppTheme.primaryColor),
            SizedBox(width: 5.w),
            Expanded(
              child: TextField(
                obscureText: obscureText!,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                ),
              ),
            ),
            isPassword != null && isPassword!
                ? IconButton(
                  onPressed: () {
                    controller.showPassword();
                  },
                  icon: Icon(
                    controller.isShow.value
                        ? LucideIcons.eye
                        : LucideIcons.eyeOff,
                  ),
                )
                : Container(),
          ],
        ),
      
    );
  }
}
