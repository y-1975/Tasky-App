import 'package:flutter/material.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'package:tasky/core/Style/app_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String lable;
  final IconData? icon;
  final double buttomWidth;
  final VoidCallback onPress;
  const ButtonWidget({
    super.key,
    required this.lable,
    required this.onPress,
    required this.buttomWidth,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green15B,
        fixedSize: Size(buttomWidth, 40),
      ),

      label: Text(lable, style: AppTextStyles.buttomTextStyle),
      icon: Icon(icon, color: AppColors.whiteFFF),
    );
  }
}
