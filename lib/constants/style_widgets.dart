import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';

class StyleWidgets{

  static BoxDecoration pageDecoration = new BoxDecoration(
              color: AppColors.appGrey,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
             
            );
}