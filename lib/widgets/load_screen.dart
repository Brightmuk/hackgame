import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({ Key key }) : super(key: key);

  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: AppColors.appGrey,
            ),
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
                    CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(AppColors.appGreen),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    Text('Loading...',style: AppTextStyles.themedText,)
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
