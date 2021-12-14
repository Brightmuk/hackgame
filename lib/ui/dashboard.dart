import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/ui/account_screen.dart';
import 'package:hackgame/ui/dashboard/account_window.dart';
import 'package:hackgame/ui/dashboard/activity_logger_window.dart';
import 'package:hackgame/ui/dashboard/assets_window.dart';
import 'package:hackgame/ui/dashboard/contracts_window.dart';
import 'package:hackgame/ui/dashboard/crypto_window.dart';
import 'package:hackgame/ui/dashboard/device_status_window.dart';
import 'package:hackgame/ui/dashboard/exploits_window.dart';
import 'package:hackgame/ui/dashboard/money_window.dart';
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
    return Container(
        width: AppSizes.screenWidth(context),
        height: AppSizes.screenHeight(context),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: AppSizes.screenWidth(context),
              height: AppSizes.screenHeight(context) * 0.05,
              child: Stack(
                children: [
                  Positioned(left: 0,child: AccountWindow()),
                  Positioned(right: 125, child: MoneyWindow()),
                  Positioned(right: 0, child: CryptoWindow())
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
                      child: ExploitsWindow()),
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
        ));
  }
}

void expand(Widget target) {}
