import 'package:flutter/material.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/window.dart';

class ErrorDialogue extends StatelessWidget {
  final String errorText;


  const ErrorDialogue({ Key key,this.errorText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Window(
        height: 180.sp,
        color: Colors.black,
        width: AppSizes.screenWidth(context)*0.9,
        content: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(errorText,style: AppTextStyles.normalThickText,),
             
              SizedBox(height: 10,),
              Center(
                child: Button(
                  height: 30.sp,
                  width: 80.sp,
                  text: 'OK',
                  onTap: () {
                     Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}