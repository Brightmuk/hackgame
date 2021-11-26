import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/text_styles.dart';

class AppInputDecoration{

static InputDecoration otherTextInputDeco=InputDecoration(
    focusColor: AppColors.appGreen,
    fillColor: AppColors.fadedWhite,
    filled: true,
    hintStyle: AppTextStyles.normalText,
    labelStyle: AppTextStyles.normalText,
    contentPadding: EdgeInsets.symmetric(horizontal: 3,vertical: 3),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.appGreen, width: 1.5),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.appGreen, width: 1.5),
    ),
);

}