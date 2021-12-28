import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/ui/account_screen.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountWindow extends StatefulWidget {
  const AccountWindow({Key key}) : super(key: key);

  @override
  _AccountWindowState createState() => _AccountWindowState();
}

class _AccountWindowState extends State<AccountWindow> {
  @override
  Widget build(BuildContext context) {
  final AuthProvider authProvider = Provider.of<AuthProvider>(context);
  final AppUser user = authProvider.user;
    return Window(
      onTap: (){
            showCupertinoDialog(
        context: context,
        builder: (context) => AccountScreen());
      },
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left:8.0.sp),
            child: Text(user.alias,
                style: AppTextStyles.normalText.copyWith(fontFamily: "Hack", fontSize: 16.sp)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'LV.${user.level}',
                style: AppTextStyles.infoText,
              ),
              Text(
                'CR.${user.reputation}',
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
