import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/style_widgets.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/services/user_service.dart';
import 'package:hackgame/ui/dashboard/account_window.dart';
import 'package:hackgame/ui/dashboard/crypto_window.dart';
import 'package:hackgame/ui/dashboard/money_window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/action_dialogue.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/edit_screen.dart';
import 'package:hackgame/widgets/select_avatar.dart';
import 'package:provider/provider.dart';
import 'package:hackgame/models/appUser.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  void changeAvatar(){
    showCupertinoModalPopup(
    context: context,
    builder: (context) => SelectAvatar(
      select: (img){
          UserService().updateProfile(toEdit: 'avatar',newValue: img);
    },));
  }

  @override
  Widget build(BuildContext context) {
  final AuthProvider authProvider = Provider.of<AuthProvider>(context);
  final AppUser user = authProvider.user;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: AppSizes.windowPadding,
        child: Stack(
          children: [
          Container(
            decoration: StyleWidgets.pageDecoration,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(children: [
              Container(
                  width: AppSizes.screenWidth(context),
                  height: AppSizes.screenHeight(context) * 0.05,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: AppColors.appGreen,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(right: 125, child: MoneyWindow()),
                      Positioned(right: 0, child: CryptoWindow())
                    ],
                  ),
              ),
              SizedBox(height: 50.sp,),
              Stack(
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
                          
                          backgroundImage: AssetImage('assets/images/avatars/'+user.avatar,),
                        )),
                  ),
                  IconButton(
                    onPressed: changeAvatar,
                    icon: Icon(Icons.camera_alt,size: 40,color: AppColors.appGreen.withOpacity(0.4)),
                    )
                ],
              ),
              SizedBox(height: 10.sp,),
              Text(user.username,style: AppTextStyles.largeThickText,),
              SizedBox(height: 10.sp,),
              Row(
                  children: [
                    Text('Details',style: AppTextStyles.themedHeader,),
                  ],
              ),
              
              Divider(height: 2,color: AppColors.appGreen,),
              SizedBox(height: 10.sp,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Alias: ${user.alias}',style: AppTextStyles.largeText,),
                    Button(
                      height: 30.sp,
                      width: 80.sp,
                      text: 'EDIT',
                      onTap: (){
                          showCupertinoDialog(
                          context: context,
                          builder: (context) => EditScreen(toEdit: 'alias',onSave: (val){
                            UserService().updateProfile(
                              toEdit: 'alias',
                              newValue: val
                            );
                            }));
                      },
                      )
                  ],
              ),
              SizedBox(height: 10.sp,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('IP address: ${user.ip}',style: AppTextStyles.largeText,),
                    Button(
                      height: 30.sp,
                      width: 80.sp,
                      text: 'EDIT',
                      onTap: (){
                          showCupertinoDialog(
                          context: context,
                          builder: (context) => EditScreen(toEdit: 'ip',isIp: true,onSave: (val){
                            UserService().updateProfile(
                              toEdit: 'ip',
                              newValue: val
                            );
                          },));
                      },
                      )
                  ],
              ),
              SizedBox(height: 10.sp,),
              Row(
                  children: [
                    Text('Level: ${user.level}',style: AppTextStyles.largeText,),
                  ],
              ),
              SizedBox(height: 10.sp,),
              Row(
                  children: [
                    Text('Cyber reputation: ${user.reputation}',style: AppTextStyles.largeText,),
                  ],
              ),
              SizedBox(height: 20.sp,),
              Row(
                  children: [
                    Text('Stats',style: AppTextStyles.themedHeader,),
                  ],
              ),
              
              Divider(height: 2,color: AppColors.appGreen,),
              SizedBox(height: 20.sp,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(user.attacks.toString(),style: AppTextStyles.infoText,),
                        Text('Attacks',style: AppTextStyles.normalText,)
                      ],
                    ),
                    Column(
                      children: [
                        Text(user.contracts.toString(),style: AppTextStyles.infoText,),
                        Text('Contracts',style: AppTextStyles.normalText,)
                      ],
                    ),
                    Column(
                      children: [
                        Text(user.hacks.toString(),style: AppTextStyles.infoText,),
                        Text('Hacks',style: AppTextStyles.normalText,)
                      ],
                    ),
                  ],
              ),
              SizedBox(height: 20.sp,),
              Row(
                  children: [
                    Text('Account',style: AppTextStyles.themedHeader,),
                  ],
              ),
              
              Divider(height: 2, color: AppColors.appGreen,),
              SizedBox(height: 20.sp,),
              Button(
                  width: AppSizes.screenWidth(context)*0.9,
                  height: 40.sp,
                  text: 'Leaderboard',
                  onTap: (){

                  },
                  ),
               SizedBox(height: 10.sp,),
              Button(
                  width: AppSizes.screenWidth(context)*0.9,
                  height: 40.sp,
                  text: 'Hackers Manual',
                  onTap: (){

                  },
                  ),
               SizedBox(height: 10.sp,),
              Button(
                  width: AppSizes.screenWidth(context)*0.9,
                  height: 40.sp,
                  text: 'Purchase History',
                  onTap: (){

                  },
                  ),
               SizedBox(height: 10.sp,),
              Button(
                  width: AppSizes.screenWidth(context)*0.9,
                  height: 40.sp,
                  text: 'Help & Support',
                  onTap: (){

                  },
                  ),
               SizedBox(height: 10.sp,),
              Button(
                  width: AppSizes.screenWidth(context)*0.9,
                  height: 40.sp,
                  text: 'Logout',
                  onTap: ()async{
                         await showCupertinoDialog(
                          context: context,
                          builder: (context) => ActionDialogue(
                            infoText: 'Are you sure you want to logout',
                            actionBtnText: 'LOGOUT',
                            action:(){
                            authProvider.signOut();
                            Navigator.pop(context);
                          } ,)
                          );
                    
                  },
                  ),
               SizedBox(height: 20.sp,),
              Text('App Version: 1.2.3',style: AppTextStyles.miniText,)
            ]),
                )),
          ),
        ]),
      ),
    );
  }
}

