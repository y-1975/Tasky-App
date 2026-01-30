import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/Style/app_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle headLine = TextStyle(
    fontFamily: AppFonts.seconFont,
    color: AppColors.whiteFFF,
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
  );
  static TextStyle buttomTextStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    color: AppColors.whiteFFF,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );

  static TextStyle hintTextStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    color: AppColors.grey6D6,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
}
