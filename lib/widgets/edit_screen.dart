import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/functions/random_ip.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/window.dart';

class EditScreen extends StatefulWidget {
  final String toEdit;
  final Function onSave;
  final bool isIp;
  const EditScreen({ Key key,this.toEdit ,this.onSave,this.isIp=false}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _toEditC = TextEditingController();
  String ip = '';
  bool isChange=false;

  @override
  void initState(){
    super.initState();
    ip=randomIp();
  }

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
                widget.isIp?Text(ip,style: AppTextStyles.normalText,):
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
                  mainAxisAlignment:widget.isIp?MainAxisAlignment.center:
                   MainAxisAlignment.spaceBetween,
                  children: widget.isIp?[
                   Button(
                    height: 30.sp,
                    width: 80.sp,
                    text: isChange?'SAVE':'CHANGE',
                    onTap: (){
                      if(!isChange){
                        setState(() {
                            ip=randomIp();  
                            isChange=true;                           
                          });
                      }else{
                        widget.onSave(ip);
                         Navigator.pop(context);
                      }
                    },
                    )
                  ]: [
                  Button(
                    height: 30.sp,
                    width: 80.sp,
                    text: 'CANCEL',
                    onTap: (){
                    Navigator.pop(context);
                    },
                    ),
                   Button(
                    height: 30.sp,
                    width: 80.sp,
                    text: 'SAVE',
                    onTap: (){
                      widget.onSave(_toEditC.value.text);
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