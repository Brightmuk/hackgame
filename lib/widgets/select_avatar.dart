import 'package:flutter/material.dart';
import 'package:hackgame/constants/avatart.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/window.dart';

class SelectAvatar extends StatelessWidget {

  final Function select;

  const SelectAvatar({ Key key,this.select }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Window(
        height: 500.sp,
        color: Colors.black,
        width: AppSizes.screenWidth(context)*0.9,
        content: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Select your avatar',style: AppTextStyles.normalThickText,),
             
              SizedBox(height: 10,),
              Container(
                height: AppSizes.screenHeight(context)*0.4,
                child: GridView.builder(
                  physics: ScrollPhysics(),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2
                    ),
                    itemCount: avatars.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          select(avatars[index]);
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                        
                          'assets/images/avatars/'+avatars[index],
                          width: 50.sp,
                          height: 50.sp,
                          )
                        );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}