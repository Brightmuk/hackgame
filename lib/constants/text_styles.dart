import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles{

  static TextStyle themedHeader = TextStyle(color: AppColors.appGreen, fontSize: 15.sp,fontWeight: FontWeight.bold,fontFamily: "Hack");
  static TextStyle themedText = TextStyle(color: AppColors.appGreen, fontSize: 10.sp,fontWeight: FontWeight.bold,);

  static TextStyle infoText = TextStyle(color: AppColors.appBlue,fontSize: 12.sp,fontWeight: FontWeight.bold,);

  static TextStyle normalText = TextStyle(color: Colors.white,fontSize: 13.sp,);
  static TextStyle normalThickText = TextStyle(color: Colors.white,fontSize: 13.sp,fontWeight: FontWeight.bold);

  static TextStyle miniText = TextStyle(color: Colors.white,fontSize: 10.sp,);
  static TextStyle macroText = TextStyle(color: Colors.white,fontSize: 11.sp);
}