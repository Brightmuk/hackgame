import 'package:flutter/material.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/window.dart';

class BuyDialogue extends StatelessWidget {
  final String infoText;
  final Function action;
  final int cryptoAmount;
  final int moneyAmount;

  const BuyDialogue({ Key key,this.infoText,this.action,this.moneyAmount,this.cryptoAmount }) : super(key: key);

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
                        text: 'Cancel',
                        onTap: () {
                           Navigator.pop(context);
                        },
                      ),
                      cryptoAmount!=null? Button(
                        height: 30.sp,
                        width: 80.sp,
                        text: '$cryptoAmount C',
                        onTap: () {
                           Navigator.pop(context);
                        },
                      ):Container(),
                      moneyAmount!=null? Button(
                        height: 30.sp,
                        width: 80.sp,
                        text: '\$ $moneyAmount',
                        onTap: () {
                           Navigator.pop(context);
                        },
                      ):Container(),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}