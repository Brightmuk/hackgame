import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/style_widgets.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: StyleWidgets.pageDecoration
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                flex: 2,
                child: new Container(
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Hero(
                        tag: "splashscreenImage",
                        child: new Container(child: Image.asset('assets/images/hacker_logo.png'),),
                      ),
                      radius: 100.sp,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Text('Hacked',textScaleFactor: 2,style: AppTextStyles.themedHeader.copyWith(fontSize: 25),),
                  ],
                )),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Button(
                        width: AppSizes.screenWidth(context)*0.9,
                        text: 'Google Login',
                        icon: Image.asset('assets/images/google_logo.png',width: 30,),
                        onTap: (){
                          authProvider.googleLogin();
                        },
                      ),
                      SizedBox(height: 20.sp,),
                      Button(
                        width: AppSizes.screenWidth(context)*0.9,
                        text: 'Facebook Login',
                        icon: Image.asset('assets/images/facebook_logo.png',width: 40,),
                        onTap: (){
                          authProvider.facebookLogin();
                        },
                      ),
                      SizedBox(height: 20.sp,),
                      Button(
                        width: AppSizes.screenWidth(context)*0.9,
                        text: 'Google play Login',
                        icon: Image.asset('assets/images/google_play_logo.png',width: 30,),
                        onTap: (){
                          authProvider.facebookLogin();
                        },
                      )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

