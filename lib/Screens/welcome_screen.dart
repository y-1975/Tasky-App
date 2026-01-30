
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/Screens/home_screen.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'package:tasky/core/Style/app_styles.dart';
import 'package:tasky/core/Widgets/buttomn_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
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
              Padding(
                padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: AppTextStyles.hintTextStyle.copyWith(
                        color: AppColors.whiteFFF,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your name";
                        }

                        int firstChar = value.trim().runes.first;

                        if (firstChar < 65 || firstChar > 90) {
                          return "Name must start with a capital letter";
                        }
                        return null;
                      },
                      style: TextStyle(color: AppColors.whiteFFF),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'e.g. Sarah Khalid',
                        hintStyle: AppTextStyles.hintTextStyle,
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
                      onPress: () {
                        _key.currentState?.validate();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      buttomWidth: 343.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
