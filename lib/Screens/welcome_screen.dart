import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'package:tasky/core/Style/app_styles.dart';
import 'package:tasky/core/Widgets/buttomn_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/Logo.svg'),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 16.w),
                child: Text('Tasky', style: AppTextStyles.headLine),
              ),
            ],
          ),
          SizedBox(height: 108.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome To Tasky ', style: AppTextStyles.headLine),
              SvgPicture.asset('assets/icons/waving-hand.svg'),
            ],
          ),
          Text(
            'Your productivity journey starts here.',
            style: AppTextStyles.headLine.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 24.h),
          SvgPicture.asset('assets/images/welcome_image.svg'),
          SizedBox(height: 28.h),
          SizedBox(
            height: 155.h,
            width: 343.w,
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full Name', style: AppTextStyles.buttomTextStyle),
                  SizedBox(height: 8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'e.g. Sarah Khalid',
                      filled: true,
                      fillColor: AppColors.black282,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ButtomWidget(
                    lable: 'Let\'s Get Started',
                    onPress: () {},
                    buttomWidth: 343.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
