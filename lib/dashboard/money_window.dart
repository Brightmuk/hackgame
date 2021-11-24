import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';

class MoneyWindw extends StatefulWidget {
  const MoneyWindw({Key key}) : super(key: key);

  @override
  _MoneyWindwState createState() => _MoneyWindwState();
}

class _MoneyWindwState extends State<MoneyWindw> {
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
