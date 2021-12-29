import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/style_widgets.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/ui/account_screen.dart';
import 'package:hackgame/ui/dashboard/account_window.dart';
import 'package:hackgame/ui/dashboard/activity_logger_window.dart';
import 'package:hackgame/ui/dashboard/assets_window.dart';
import 'package:hackgame/ui/dashboard/contracts_window.dart';
import 'package:hackgame/ui/dashboard/crypto_window.dart';
import 'package:hackgame/ui/dashboard/device_status_window.dart';
import 'package:hackgame/ui/dashboard/tools_window.dart';
import 'package:hackgame/ui/dashboard/messages_window.dart';
import 'package:hackgame/ui/dashboard/credit_window.dart';
import 'package:hackgame/ui/dashboard/processes_window.dart';

import '../constants/sizes.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: StyleWidgets.pageDecoration,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              alignment: Alignment.center,
              child: SafeArea(
                child: Container(
        width: AppSizes.screenWidth(context),
        height: AppSizes.screenHeight(context),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: AppSizes.screenWidth(context),
              height: AppSizes.screenHeight(context) * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccountWindow(),
                  MoneyWindow(),
                  CryptoWindow(),
                  MessagesWindow()
                ],
              ),
            ),
            Container(
              height: AppSizes.screenHeight(context) * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProcessWindow(),
                  ActivityLoggerWindow(),
                ],
              ),
            ),
            Container(
              height: AppSizes.screenHeight(context) * 0.1,
              child: Stack(
                children: [DeviceStatusWindow()],
              ),
            ),
            Container(
              height: AppSizes.screenHeight(context) * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: AppSizes.screenHeight(context) * 0.4,
                      child: ToolsWindow()),
                  Container(
                    height: AppSizes.screenHeight(context) * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ ContractsWindow(),AssetsWindow()],
                    ),
                  )
                ],
              ),
            ),
            SizedBox()
          ],
        )),
              ),
            ),
          ),
        ],
      ),
    );
 
  }
}


