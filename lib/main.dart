import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/ui/dashboard.dart';

void main() {
  runApp(MyApp());
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
        home: MyHomePage(),
      ),
      
      designSize: const Size(414, 896),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              alignment: Alignment.center,
              child: SafeArea(
                child: DashBoard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
