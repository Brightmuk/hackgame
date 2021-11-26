import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/ui/dashboard/account_window.dart';
import 'package:hackgame/ui/dashboard/crypto_window.dart';
import 'package:hackgame/ui/dashboard/money_window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/edit_screen.dart';
import 'package:hackgame/widgets/window.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: AppSizes.windowPadding,
        child: Stack(
          children: [
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
                alignment: Alignment.center,
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
                  CircleAvatar(
                      radius:60.sp,
                      backgroundColor: AppColors.appGreen,
                      child: SizedBox(
                          width:116.sp,
                          height:116.sp,
                          child:CircleAvatar(
                            radius:60.sp,
                            backgroundColor: Colors.grey[900],
                            backgroundImage: NetworkImage(''),
                            
                          )
                      ),
                  ),
                  SizedBox(height: 10.sp,),
                  Text('Bright Mukonesi',style: AppTextStyles.largeThickText,),
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
                        Text('Alias: Hackervybe',style: AppTextStyles.largeText,),
                        Button(
                          height: 30.sp,
                          width: 80.sp,
                          text: 'Edit',
                          onTap: (){
                              showCupertinoDialog(
                              context: context,
                              builder: (context) => EditScreen(toEdit: 'Alias',));
                          },
                          )
                      ],
                  ),
                  SizedBox(height: 10.sp,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('IP address: 192.34.5.02',style: AppTextStyles.largeText,),
                        Button(
                          height: 30.sp,
                          width: 80.sp,
                          text: 'Edit',
                          onTap: (){
                              showCupertinoDialog(
                              context: context,
                              builder: (context) => EditScreen(toEdit: 'IP',));
                          },
                          )
                      ],
                  ),
                  SizedBox(height: 10.sp,),
                  Row(
                      children: [
                        Text('Level: 50',style: AppTextStyles.largeText,),
                      ],
                  ),
                  SizedBox(height: 10.sp,),
                  Row(
                      children: [
                        Text('Cyber reputation: 3400',style: AppTextStyles.largeText,),
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
                            Text('10',style: AppTextStyles.infoText,),
                            Text('Attacks',style: AppTextStyles.normalText,)
                          ],
                        ),
                        Column(
                          children: [
                            Text('5',style: AppTextStyles.infoText,),
                            Text('Contracts',style: AppTextStyles.normalText,)
                          ],
                        ),
                        Column(
                          children: [
                            Text('30',style: AppTextStyles.infoText,),
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
                      onTap: (){

                      },
                      ),
                   SizedBox(height: 20.sp,),
                  Text('App Version: 1.2.3',style: AppTextStyles.miniText,)
                ]),
                    ))),
          ),
        ]),
      ),
    );
  }
}

