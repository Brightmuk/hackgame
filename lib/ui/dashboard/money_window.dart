import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';

class MoneyWindow extends StatefulWidget {
  const MoneyWindow({Key key}) : super(key: key);

  @override
  _MoneyWindowState createState() => _MoneyWindowState();
}

class _MoneyWindowState extends State<MoneyWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: '\$',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.appGreen)),
                TextSpan(
                    text: ' 30',
                    style: AppTextStyles.normalThickText
                        .copyWith(color: Colors.white)),
              ],
            ),
          ),
          Icon(
            Icons.add,
            color: AppColors.appGreen,
            size: 20,
          )
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.047,
      width: 100,
    );
  }
}
