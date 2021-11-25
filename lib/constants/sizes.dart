import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes{

static screenHeight(context){
  return MediaQuery.of(context).size.height;
}

static screenWidth(context){
  return MediaQuery.of(context).size.width;
}

static EdgeInsets windowPadding = EdgeInsets.symmetric(horizontal: 10.sp);
static EdgeInsets topBottomPadding = EdgeInsets.symmetric(vertical: 5.sp);


}
