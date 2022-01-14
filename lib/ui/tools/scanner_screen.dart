import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/assets_images.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/style_widgets.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/models/tools.dart';
import 'package:hackgame/services/user_service.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScannerScreen extends StatefulWidget {
  final Tool tool;
  const ScannerScreen({ Key key,this.tool }) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Available devices',style: AppTextStyles.themedHeader,),
        SizedBox(height: 10.sp,),
        Container(
          height: AppSizes.screenHeight(context)*0.5,
          child: FutureBuilder<List<AppUser>>(
            future: UserService().appUsersFuture,
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(child: Text('An error occurred',style: AppTextStyles.normalText,));
              }
              if(snapshot.hasData){
                List<AppUser> devices = snapshot.data;
              return ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context,index){
                    return DeviceTile(ip:devices[index].ip);
                  }
                );
              }else{
                  return  Center(
                    child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(AppColors.appGreen),
                ),
                  );
              }

            }
          ),
        ),
        SizedBox(height: 20.sp,),
        Button(
          height: 40,
          width: AppSizes.screenWidth(context)*0.8,
          text: 'SCAN',
          onTap: (){

          },
        )
        
    ],);
  }
}

class DeviceTile extends StatelessWidget {
  final String ip;
  const DeviceTile({ Key key,this.ip }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(ip,style: AppTextStyles.normalText,),
        Button(
          height: 30,
          width: 80,
          text: 'EXPLOIT',
          onTap: (){

          },
        )
      ],),
    );
  }
}