import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
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
      backgroundColor: Colors.black,
      body: Padding(
        padding: AppSizes.windowPadding,
        child: Stack(children: [
          Container(

            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Container(
              
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: AppSizes.screenHeight(context)*0.7,
                      ),
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
                    ]),
              ),
            )),
          ),
        ]),
      ),
    );
  }
}
