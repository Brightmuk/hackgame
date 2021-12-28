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
import 'package:hackgame/ui/dashboard/money_window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/ui/single_exploit.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/buy_dialogue.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int currentTab = 0;

  void changeTab(index) {
    setState(() {
      currentTab = index;
    });
  }

  Widget currentTabDisplay(index) {
    switch (index) {
      case 0:
        return Store();
      case 1:
        return Inventory();
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
                                'Notifications',
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
                                  child: Text('Inbox',
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
                    SizedBox(height: 20.sp,),
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

class Store extends StatelessWidget {
  const Store({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExploitList(isMessage: false,),
    );
  }
}
class Inventory extends StatelessWidget {
  const Inventory({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExploitList(isMessage: true,),
    );
  }
}

class ExploitList extends StatelessWidget {
  final bool isMessage;
  const ExploitList({ Key key,this.isMessage }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height: AppSizes.screenHeight(context)*0.8,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.notifications_outlined,color: AppColors.appGreen,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('James',style: AppTextStyles.normalThickText,),
                      Text('Hello, I wanna pay the ransom',style: AppTextStyles.macroText,),
                      Text('2021-23-2',style: AppTextStyles.miniText,)
                     
                    ],
                  ),
                  SizedBox(width: 130.sp,),
                  Button(
                    height: 30.sp,
                    width: 80.sp,
                    text: isMessage?'VIEW':'OK',
                    onTap: (){
                      if(isMessage){
                        showCupertinoDialog(
                        context: context,
                        builder: (context) =>SingleExploitScreen());
                      }else{
                      showCupertinoDialog(
                          context: context,
                          // backgroundColor: Colors.transparent,
                          builder: (context) {
                            return BuyDialogue(
                              moneyAmount: 4500,
                              cryptoAmount: 400,
                              infoText: 'Buy the password cracker',
                            );
                          });
                      }
                    },
                    ),
                ],
              ),
            );
          }
          ),
      ),
    );
  }
}