import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/window.dart';

class EditScreen extends StatefulWidget {
  final String toEdit;
  const EditScreen({ Key key,this.toEdit }) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _toEditC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.barrierBlack,
      body: Center(
        child: Window(
          expanded: true,
          height: AppSizes.screenHeight(context)*0.2,
          width: AppSizes.screenWidth(context)*0.8,
          content: Padding(
            padding: AppSizes.windowPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('New '+ widget.toEdit,style: AppTextStyles.normalThickText,),
               
                SizedBox(height: 10,),
                TextFormField(
                    cursorColor: AppColors.appGreen,
                    controller: _toEditC,
                    style: AppTextStyles.normalText,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    maxLength: 200,

                    decoration: AppInputDecoration.otherTextInputDeco.copyWith(),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Enter ${widget.toEdit}';
                      } else {
                        return null;
                      }
                    },
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Button(
                    height: 30.sp,
                    width: 80.sp,
                    text: 'Cancel',
                    onTap: (){
                    Navigator.pop(context);
                    },
                    ),
                  Button(
                    height: 30.sp,
                    width: 80.sp,
                    text: 'Save',
                    onTap: (){
                      Navigator.pop(context);
                    },
                    )
                ],)
              ],
            ),
          ),
        ),
      ),
    );

  }
}