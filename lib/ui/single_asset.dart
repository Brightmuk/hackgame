import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/assets_images.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/ui/dashboard/account_window.dart';
import 'package:hackgame/ui/dashboard/crypto_window.dart';
import 'package:hackgame/ui/dashboard/money_window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/action_dialogue.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SingleAssetScreen extends StatefulWidget {
  const SingleAssetScreen({Key key}) : super(key: key);

  @override
  _SingleAssetScreenState createState() => _SingleAssetScreenState();
}

class _SingleAssetScreenState extends State<SingleAssetScreen> {
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
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Positioned(right: 125, child: MoneyWindow()),
                          Positioned(right: 0, child: CryptoWindow())
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Divider(
                      height: 2,
                      color: AppColors.appGreen,
                    ),
                    Container(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 20.sp,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(UserAssetImage.asset1))),
                          height: AppSizes.screenHeight(context) * 0.3,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Details',
                              style: AppTextStyles.themedHeader,
                            ),
                          ],
                        ),
                        Divider(
                          height: 2,
                          color: AppColors.appGreen,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mavoic Castle ',
                                  style: AppTextStyles.normalThickText,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Level 10 property',
                                  style: AppTextStyles.normalText,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Pricing',
                              style: AppTextStyles.themedHeader,
                            ),
                          ],
                        ),
                        Divider(
                          height: 2,
                          color: AppColors.appGreen,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppSizes.screenWidth(context)*0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current Price: ',
                                    style: AppTextStyles.normalThickText,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(''),
                                      Text(
                                        '\$ 45600',
                                        style: AppTextStyles.normalText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Button(
                              height: 30.sp,
                              width: 80.sp,
                              text: 'SELL',
                              onTap: (){
                                                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return ActionDialogue(
                              actionBtnText: 'SELL',
                              infoText: 'Sell the Hurrance at',
                            );
                          });
                              },
                              ),

                          ],
                        ),
                        SizedBox(height: 20.sp,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppSizes.screenWidth(context)*0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Apreciation rate: ',
                                    style: AppTextStyles.normalThickText,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(''),
                                      Text(
                                        '2% per day',
                                        style: AppTextStyles.normalText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                             Button(height: 30.sp,width: 80.sp,text: 'REVAMP',),
                          ],
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Statistics',
                              style: AppTextStyles.themedHeader,
                            ),
                          ],
                        ),
                        Divider(
                          height: 2,
                          color: AppColors.appGreen,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          children: [
                            Text(
                                      '0 Hack compromises [Affects pricing]',
                                      style: AppTextStyles.normalText,
                                    ),
                          ],
                        ),
                      ],

                    ))
                  ]),
            )),
          ),
        ]),
      ),
    );
  }
}
