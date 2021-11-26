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

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key key}) : super(key: key);

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
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
              

                child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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

                        ],
                      ),
                  ),

                  SizedBox(height: 50.sp,),
                  Container(
                    
                    height: AppSizes.screenHeight(context)*0.2,
                    width: AppSizes.screenWidth(context),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                         top:30.sp,
                          child: CircleAvatar(
                              radius:70.sp,
                              backgroundColor: AppColors.appGreen,
                              child: SizedBox(
                                  width:135.sp,
                                  height:135.sp,
                                  child:CircleAvatar(
                                    radius:70.sp,
                                    backgroundColor: Colors.grey[900],
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/crypto.png',
                                           width: 20,
                                        ),
                                        Text(' 340',
                                            style: AppTextStyles.normalThickText
                                                .copyWith(fontSize: 30.sp)),
                                      ],
                                    ),
                                    
                                  )
                              ),
                          ),
                        ),
                        Image.asset('assets/images/bitcoin.png',width: 80.sp,)
                      ],
                    ),
                  ),

                SizedBox(height: 50.sp,),
                  Row(
                      children: [
                        Text('Buy More',style: AppTextStyles.themedHeader,),
                      ],
                  ),
                  SizedBox(height: 10.sp,),
                  Divider(height: 2,color: AppColors.appGreen,),
                  SizedBox(height: 20.sp,),
                  Window(
                    width: AppSizes.screenWidth(context)*0.95,
                    height: AppSizes.screenHeight(context)*0.08,
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                          children: [
                            Image.asset(
                              'assets/images/crypto.png',
                               width: 15,
                            ),
                            Text(' 340',
                                style: AppTextStyles.normalThickText
                                    ),
                          ],
                        ),
                          SizedBox(),
                          Button(
                            height: 30.sp,
                            width: 80.sp,
                            text: 'Ksh.300',
                            onTap: (){
                                showCupertinoDialog(
                                context: context,
                                builder: (context) => EditScreen(toEdit: 'IP',));
                            },
                            )
                        ],
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                 Window(
                    width: AppSizes.screenWidth(context)*0.95,
                    height: AppSizes.screenHeight(context)*0.08,
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                          children: [
                            Image.asset(
                              'assets/images/crypto.png',
                               width: 15,
                            ),
                            Text(' 340',
                                style: AppTextStyles.normalThickText
                                    ),
                          ],
                        ),
                          SizedBox(),
                          Button(
                            height: 30.sp,
                            width: 80.sp,
                            text: 'Ksh.300',
                            onTap: (){
                                showCupertinoDialog(
                                context: context,
                                builder: (context) => EditScreen(toEdit: 'IP',));
                            },
                            )
                        ],
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                 Window(
                    width: AppSizes.screenWidth(context)*0.95,
                    height: AppSizes.screenHeight(context)*0.08,
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                          children: [
                            Image.asset(
                              'assets/images/crypto.png',
                               width: 15,
                            ),
                            Text(' 340',
                                style: AppTextStyles.normalThickText
                                    ),
                          ],
                        ),
                           SizedBox(),
                          Button(
                            height: 30.sp,
                            width: 80.sp,
                            text: 'Ksh.300',
                            onTap: (){
                                showCupertinoDialog(
                                context: context,
                                builder: (context) => EditScreen(toEdit: 'IP',));
                            },
                            )
                        ],
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                  Window(
                    width: AppSizes.screenWidth(context)*0.95,
                    height: AppSizes.screenHeight(context)*0.08,
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Row(
                          children: [
                            Image.asset(
                              'assets/images/crypto.png',
                               width: 15,
                            ),
                            Text(' 340',
                                style: AppTextStyles.normalThickText
                                    ),
                          ],
                        ),
                           SizedBox(),
                          Button(
                            height: 30.sp,
                            width: 80.sp,
                            text: 'Ksh.300',
                            onTap: (){
                                showCupertinoDialog(
                                context: context,
                                builder: (context) => EditScreen(toEdit: 'IP',));
                            },
                            )
                        ],
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                  Window(
                    width: AppSizes.screenWidth(context)*0.95,
                    height: AppSizes.screenHeight(context)*0.08,
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                          children: [
                            Image.asset(
                              'assets/images/crypto.png',
                              width: 15,
                            ),
                            Text(' 340',
                                style: AppTextStyles.normalThickText
                                    ),
                          ],
                        ),
                           SizedBox(),
                          Button(
                            height: 30.sp,
                            width: 80.sp,
                            text: 'Ksh.300',
                            onTap: (){
                                showCupertinoDialog(
                                context: context,
                                builder: (context) => EditScreen(toEdit: 'IP',));
                            },
                            )
                        ],
                    ),
                  ),
                  

                ]),
                ))),
          ),
        ]),
      ),
    );
  }
}
