import 'package:flutter/material.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'package:tasky/core/Style/app_styles.dart';

class ButtomWidget extends StatelessWidget {
  final String lable;
  final double buttomWidth;
  final VoidCallback onPress;
  const ButtomWidget({
    super.key,
    required this.lable,
    required this.onPress,
    required this.buttomWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.green15B , fixedSize: Size(buttomWidth, 40)),
    
      child: Text(lable, style: AppTextStyles.buttomTextStyle),
    );
  }
}
