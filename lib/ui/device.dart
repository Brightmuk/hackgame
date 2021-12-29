import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/style_widgets.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/ui/dashboard/account_window.dart';
import 'package:hackgame/ui/dashboard/crypto_window.dart';
import 'package:hackgame/ui/dashboard/credit_window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key key}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  int currentTab = 0;

  void changeTab(index) {
    setState(() {
      currentTab = index;
    });
  }

  Widget currentTabDisplay(index) {
    switch (index) {
      case 0:
        return HardwareTab();
      case 1:
        return SoftwareTab();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: AppSizes.windowPadding,
        child: Stack(children: [
          Container(
            decoration: StyleWidgets.pageDecoration,
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
                    Container(

                      height: 40.sp,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              changeTab(0);
                            },
                            child: Container(
                               height: 40.sp,
                              padding: EdgeInsets.symmetric(horizontal:10),
                              color: currentTab == 0
                                  ? AppColors.fadedWhite
                                  : Colors.transparent,
                              child: Center(
                                  child: Text(
                                'Hardware',
                                style: AppTextStyles.normalText,
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              changeTab(1);
                            },
                            child: Container(
                               height: 40.sp,
                             padding: EdgeInsets.symmetric(horizontal:10),
                              color: currentTab == 1
                                  ? AppColors.fadedWhite
                                  : Colors.transparent,
                              child: Center(
                                  child: Text('Software',
                                      style: AppTextStyles.normalText)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: AppColors.appGreen,
                    ),
                    Container(
                      child: currentTabDisplay(currentTab),
                    )
                  ]),
            )),
          ),
        ]),
      ),
    );
  }
}

class HardwareTab extends StatelessWidget {
  const HardwareTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 20.sp,
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/systemunit.png'))),
          height: AppSizes.screenHeight(context) * 0.3,
        ),
        SizedBox(
          height: 10.sp,
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
            Container(
              height: 60.sp,
              color: AppColors.fadedWhite.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CPU ',
                    style: AppTextStyles.normalThickText,
                  ),
                ],
              ),
            ),
            Container(
              height: 60.sp,
              color: AppColors.fadedWhite.withOpacity(0.1),
              width: 380.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' 12th gen',
                    style: AppTextStyles.normalText,
                  ),
                  Text(
                    ' 3.0 GHz base clock speed',
                    style: AppTextStyles.normalText,
                  ),
                  Text(
                    ' 3.6 GHz max boost speed',
                    style: AppTextStyles.normalText,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.sp,
        ),
        Row(
          children: [
            Container(
              height: 60.sp,
              color: AppColors.fadedWhite.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'RAM ',
                    style: AppTextStyles.normalThickText,
                  ),
                ],
              ),
            ),
            Container(
              height: 60.sp,
              width: 380.sp,
              color: AppColors.fadedWhite.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2400 MHz clock frequency',
                    style: AppTextStyles.normalText,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.sp,
        ),

        Row(
          children: [
            Text(
              'Performance',
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
            CircularPercentIndicator(
              radius: AppSizes.screenWidth(context) * 0.2,
              lineWidth: 5.0,
              percent: 0.9,
              center: Text(
                "90%",
                style: AppTextStyles.normalText,
              ),
              progressColor: AppColors.appRed,
              backgroundColor: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comments',
                  style: AppTextStyles.normalThickText,
                ),
                Text('Fair',
                    style: AppTextStyles.normalText.copyWith(
                      color: AppColors.appOrange,
                    ))
              ],
            ),
            Button(
              height: 30.sp,
              width: 80.sp,
              text: 'UPGRADE',
              onTap: () {},
            )
          ],
        )
      ],
    ));
  }
}

class SoftwareTab extends StatelessWidget {
  const SoftwareTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 20.sp,
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/security.png'))),
          height: AppSizes.screenHeight(context) * 0.3,
        ),
        SizedBox(
          height: 10.sp,
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
            Container(
              height: 60.sp,
              color: AppColors.fadedWhite.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OS ',
                    style: AppTextStyles.normalThickText,
                  ),
                ],
              ),
            ),
            Container(
              height: 60.sp,
              color: AppColors.fadedWhite.withOpacity(0.1),
              width: 380.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' Level 12',
                    style: AppTextStyles.normalText,
                  ),
                  Text(
                    ' 64-bit',
                    style: AppTextStyles.normalText,
                  ),
                  Text(' Level 23 Kernel',style: AppTextStyles.normalText,)
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.sp,
        ),
        Row(
          children: [
            Container(
              height: 60.sp,
              color: AppColors.fadedWhite.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Antivirus ',
                    style: AppTextStyles.normalThickText,
                  ),
                ],
              ),
            ),
            Container(
              height: 60.sp,
              color: AppColors.fadedWhite.withOpacity(0.1),
              width: 350.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' Level 34',
                    style: AppTextStyles.normalText,
                  ),

                ],
              ),
            )
          ],
        ),

        SizedBox(
          height: 20.sp,
        ),

        Row(
          children: [
            Text(
              'Performance',
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
            CircularPercentIndicator(
              radius: AppSizes.screenWidth(context) * 0.2,
              lineWidth: 5.0,
              percent: 0.9,
              center: Text(
                "50%",
                style: AppTextStyles.normalText,
              ),
              progressColor: AppColors.appOrange,
              backgroundColor: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comments',
                  style: AppTextStyles.normalThickText,
                ),
                Text('Fair',
                    style: AppTextStyles.normalText.copyWith(
                      color: AppColors.appOrange,
                    ))
              ],
            ),
            Button(
              height: 30.sp,
              width: 80.sp,
              text: 'UPGRADE',
              onTap: () {},
            )
          ],
        ),
      ],
    ));
  }
}
