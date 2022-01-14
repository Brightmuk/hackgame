import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loader{
  static void showLoader(context){
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context, 
      builder: (context)=>LoadScreen()
      );
  }
  static void hideLoader(context){
    Navigator.pop(context);
  }
}

class LoadScreen extends StatefulWidget {
  
  const LoadScreen({ Key key }) : super(key: key);

  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        backgroundColor: AppColors.barrierBlack,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(AppColors.appGreen),
                    ),
                    SizedBox(height: 10,),
              Text('Loading...',style: AppTextStyles.themedText,)
            ],
          ),
        )
      ),
    );

  }
}
