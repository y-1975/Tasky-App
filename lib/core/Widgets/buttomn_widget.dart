import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SingleChildScrollView(
      child: SizedBox(
        height: 40.h,
        width: buttomWidth,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green15B),

          child: Text(lable, style: AppTextStyles.buttomTextStyle),
        ),
      ),
    );
  }
}
