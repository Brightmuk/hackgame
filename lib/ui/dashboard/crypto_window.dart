import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';

class CryptoWindow extends StatefulWidget {
  const CryptoWindow({Key key}) : super(key: key);

  @override
  _CryptoWindowState createState() => _CryptoWindowState();
}

class _CryptoWindowState extends State<CryptoWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          SizedBox(
            width: 50,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/crypto.png',
                ),
                Text(' 340',
                    style: AppTextStyles.normalThickText
                        .copyWith(color: Colors.white)),
              ],
            ),
          ),
          Icon(
            Icons.add,
            color: AppColors.appGold,
            size: 20,
          )
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.047,
      width: 100,
    );
  }
}
