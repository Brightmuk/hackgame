import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/ui/money_screen.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:provider/provider.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyWindow extends StatefulWidget {
  
  const MoneyWindow({Key key}) : super(key: key);

  @override
  _MoneyWindowState createState() => _MoneyWindowState();
}

class _MoneyWindowState extends State<MoneyWindow> {
  @override
  Widget build(BuildContext context) {
  final AuthProvider authProvider = Provider.of<AuthProvider>(context);
  final AppUser user = authProvider.user;

    return Window(
      onTap: (){
    showCupertinoDialog(
    context: context,
    builder: (context) => Container(
          child: Scaffold(
              backgroundColor:
                  Colors.black.withOpacity(0.8),
              body: Center(
                  child: MoneyScreen())),
        ));
      },
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'c ',
                    style: AppTextStyles.themedHeader,),
                TextSpan(
                    text: user.money.toString(),
                    style: AppTextStyles.normalThickText
                        .copyWith(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.047,
      width: 70.sp,
    );
  }
}
