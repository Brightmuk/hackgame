import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:()=>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cyberwarz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),designSize: const Size(414, 896),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);


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
              fit: BoxFit.cover
             )
            ),
          ),
          BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            alignment: Alignment.center,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Text('CHOCOLATE',style: TextStyle(color: Colors.white,fontFamily: 'Hack',fontSize: 20.sp),),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
