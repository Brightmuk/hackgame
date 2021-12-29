import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/ui/crypto_screen.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoWindow extends StatefulWidget {

  const CryptoWindow({Key key}) : super(key: key);

  @override
  _CryptoWindowState createState() => _CryptoWindowState();
}

class _CryptoWindowState extends State<CryptoWindow> {

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
                    child: CryptoScreen())),
          ));
        },
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/crypto.png',
                 
                  width: 10,
                ),
                SizedBox(width: 5,),
                Text(user.cryptoStr,
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
