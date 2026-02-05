import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'package:tasky/core/Style/app_fonts.dart';
import 'package:tasky/core/Style/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName = "";
  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString('username');
    setState(() {
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w, top: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/me.jpg',
                      width: 42.w,
                      height: 42.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Evening , $userName',
                        style: AppTextStyles.headLine.copyWith(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.mainFont,
                        ),
                      ),
                      Text(
                        'One task at a time.One step \ncloser.',
                        style: TextStyle(
                          fontFamily: AppFonts.mainFont,
                          fontSize: 14.sp,
                          color: AppColors.greyC6C,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black282,
                      shape: CircleBorder(),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/sun.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Yuhuu ,Your work Is ',
                style: AppTextStyles.headLine.copyWith(fontSize: 32.sp),
              ),
              Row(
                children: [
                  Text(
                    'almost done ! ',
                    style: AppTextStyles.headLine.copyWith(fontSize: 32.sp),
                  ),
                  SvgPicture.asset(
                    'assets/icons/waving-hand.svg',
                    width: 32.w,
                    height: 32.h,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                height: 72.h,
                width: 343.w,
                decoration: BoxDecoration(
                  color: AppColors.black282,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Achieved Tasks',
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              color: AppColors.whiteFFF,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '3 Out of 6 Done',
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              fontSize: 14.sp,
                              color: AppColors.greyC6C,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  //Progress Persentage Ex: 50%
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
