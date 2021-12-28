import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/services/user_service.dart';
import 'package:hackgame/ui/auth/login.dart';
import 'package:hackgame/ui/auth/new_account.dart';
import 'package:hackgame/ui/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/widgets/load_screen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider()
            ),
        ],
        child: MyApp(),
      ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Cyberwarz',
        theme: ThemeData(
          platform: TargetPlatform.iOS,
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
      ),
      
      designSize: const Size(414, 896),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new AuthWrapper(),
      backgroundColor: AppColors.appGrey,
      title: new Text('Hacked',textScaleFactor: 2,style: AppTextStyles.themedHeader.copyWith(fontSize: 25),),
      image: new Image.asset('assets/images/hacker_logo.png'),
      loadingText: Text("Booting device...",style: AppTextStyles.themedText,),
      photoSize: 100.sp,
      loaderColor: AppColors.appGreen,
    );
  }
}


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,sn){
        if(sn.connectionState==ConnectionState.waiting){
          return LoadScreen();
        }else if(sn.hasData){
           return AccountWrapper();
          
        }else if(sn.hasError){
          return Center(child: Text('Something went wrong!'),);
        }else{
          return LoginScreen();
        }
      }
      );
  }
}

class AccountWrapper extends StatelessWidget {
  const AccountWrapper({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser>(
      stream: UserService().appUser,
      builder: (context,sn){
        if(sn.connectionState==ConnectionState.waiting){
          return LoadScreen();
        }
        if(sn.hasData){
          return DashBoard();
        }else{
          return NewAccount();
        }
      }
      );
  }
}


