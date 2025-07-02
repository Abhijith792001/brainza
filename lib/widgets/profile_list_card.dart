import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileListCard extends StatelessWidget {
  const ProfileListCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconData,
  });
  final String title;
  final String description;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(LucideIcons.chevronRight),
      leading: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          color: AppTheme.secondaryColor,
        ),
        child: Icon(iconData),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(description),
    );
  }
}