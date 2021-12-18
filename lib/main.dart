import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/ui/auth/login.dart';
import 'package:hackgame/ui/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

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
        home: AuthWrapper(),
      ),
      
      designSize: const Size(414, 896),
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
          return Center(child: CircularProgressIndicator());
        }else if(sn.hasData){
          return DashBoard();
        }else if(sn.hasError){
          return Center(child: Text('Something went wrong!'),);
        }else{
          return LoginScreen();
        }
      }
      );
  }
}


