import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/ui/crypto_screen.dart';
import 'package:hackgame/ui/messages_screen.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesWindow extends StatefulWidget {

  const MessagesWindow({Key key}) : super(key: key);

  @override
  _MessagesWindowState createState() => _MessagesWindowState();
}

class _MessagesWindowState extends State<MessagesWindow> {

  @override
  Widget build(BuildContext context) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context);
  final AppUser user = authProvider.user;

    return Window(
      onTap: (){
      showCupertinoDialog(
      context: context,
      builder: (context) => MessagesScreen());
        },
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.mail_outline,color: AppColors.appGreen,),
          SizedBox(width: 5.sp,),
          Text('4',style: AppTextStyles.miniText,)
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.047,
      width: 70.sp,
    );
  }
}
