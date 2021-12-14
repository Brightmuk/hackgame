import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/ui/assets_screen.dart';
import 'package:hackgame/widgets/snap_scroll.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetsWindow extends StatefulWidget {
  const AssetsWindow({Key key}) : super(key: key);

  @override
  _AssetsWindowState createState() => _AssetsWindowState();
}

class _AssetsWindowState extends State<AssetsWindow> {
  int current = 0;



  @override
  Widget build(BuildContext context) {
    return Window(
      onTap: (){
      showCupertinoDialog(
        context: context,
        builder: (context) =>AssetsScreen());
      },
      content: Container(
        padding: AppSizes.topBottomPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Assets',
              style: AppTextStyles.themedHeader,
            ),
            SnapScroll(),
            Divider(
              color: Colors.grey[500],
              height: 1,
            ),
            Container(
              padding: AppSizes.windowPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'You own:',
                            style: AppTextStyles.normalThickText),
                        TextSpan(text: ' 4', style: AppTextStyles.themedHeader)
                      ])),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Available:',
                            style: AppTextStyles.normalThickText),
                        TextSpan(text: ' 4', style: AppTextStyles.themedHeader)
                      ])),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      height: AppSizes.screenHeight(context) * 0.19,
      width: AppSizes.screenWidth(context) * 0.4,
    );
  }
}
