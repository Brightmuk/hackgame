import 'package:flutter/material.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/window.dart';

class ActionDialogue extends StatelessWidget {
  final String infoText;
  final Function action;
  final String actionBtnText;

  const ActionDialogue({ Key key,this.infoText,this.action,this.actionBtnText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Window(
          height: 180.sp,
          color: Colors.black,
          width: AppSizes.screenWidth(context)*0.9,
          content: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(infoText,style: AppTextStyles.normalThickText,),
               
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                      Button(
                        height: 30.sp,
                        width: 80.sp,
                        text: 'NO',
                        onTap: () {
                           Navigator.pop(context);
                        },
                      ),
                      Button(
                        height: 30.sp,
                        width: 80.sp,
                        text: actionBtnText,
                        onTap: () {
                          action();
                           Navigator.pop(context);
                        },
                      ),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}