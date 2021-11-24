import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountWindow extends StatefulWidget {
  const AccountWindow({Key key}) : super(key: key);

  @override
  _AccountWindowState createState() => _AccountWindowState();
}

class _AccountWindowState extends State<AccountWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left:8.0.sp),
            child: Text('Alias',
                style: AppTextStyles.normalText.copyWith(fontFamily: "Hack", fontSize: 16.sp)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'LV.10',
                style: AppTextStyles.infoText,
              ),
              Text(
                'CR.450',
                style: AppTextStyles.infoText,
              )
            ],
          )
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.047,
      width: 150.sp,
    );
  }
}
