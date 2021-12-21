import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/avatart.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/functions/random_ip.dart';
import 'package:hackgame/services/user_service.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/select_avatar.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key key}) : super(key: key);

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  TextEditingController aliasC = TextEditingController();
  final name = FirebaseAuth.instance.currentUser.displayName ?? 'there';
  String ip = '';
  String avatar=avatars[0];

  @override
  void initState(){
    super.initState();
    ip=randomIp();
  }

  void changeAvatar(){
    showCupertinoModalPopup(
    context: context,
    builder: (context) => SelectAvatar(
      select: (img){
        setState(() {
            avatar = img;
        });
    },));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Padding(
        padding: AppSizes.windowPadding,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              padding: AppSizes.windowPadding,
                alignment: Alignment.center,
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text('Hello $name', style: AppTextStyles.themedHeader.copyWith(fontSize: 30)),
                        Text(
                          'Setup your hacker profile',
                          style: AppTextStyles.themedHeader.copyWith(fontSize: 30),
                        ),
                        SizedBox(
                          height: 50.sp,
                        ),

                        SizedBox(
                          height: 10.sp,
                        ),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60.sp,
                                backgroundColor: AppColors.appGreen,
                                child: SizedBox(
                                    width: 116.sp,
                                    height: 116.sp,
                                    child: CircleAvatar(
                                      radius: 60.sp,
                                      backgroundColor: Colors.grey[900],
                                      
                                      backgroundImage: AssetImage('assets/images/avatars/'+avatar,),
                                    )),
                              ),
                              IconButton(
                                onPressed: changeAvatar,
                                icon: Icon(Icons.camera_alt,size: 40,color: AppColors.appGreen.withOpacity(0.4)),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.sp,
                        ),
                        Text(
                          'Alias',
                          style: AppTextStyles.normalThickText,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        TextFormField(
                          cursorColor: AppColors.appGreen,
                          controller: aliasC,
                          style: AppTextStyles.normalText,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          maxLength: 200,
                          decoration:
                              AppInputDecoration.otherTextInputDeco.copyWith(),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Enter your alias';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Text(
                          'IP address',
                          style: AppTextStyles.normalThickText,
                        ),
                        SizedBox(
                          height: 0.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Text(ip,style: AppTextStyles.normalText,),
                          Button(
                          height: 30.sp,
                          width: 80.sp,
                          text: 'CHANGE',
                          onTap: (){
                              setState(() {
                                 ip=randomIp();                             
                               });
                          },
                          )
                        ],),
                        SizedBox(height: AppSizes.screenHeight(context)*0.3,),
                        Center(
                          child: Button(
                            height: 30.sp,
                            width: 80.sp,
                            text: 'SAVE',
                            onTap: (){
                               UserService().newUser(
                                 alias: aliasC.value.text,
                                 username: FirebaseAuth.instance.currentUser.displayName,
                                 avatar: avatar,
                                 ip: ip
                               );
                            },
                            ),
                        )
                      ]),
                ))),
          ),
        ]),
      ),
    );
  }
}
