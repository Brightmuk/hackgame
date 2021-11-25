import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgame/widgets/buttons.dart';

class ProcessWindow extends StatefulWidget {
  final bool expanded;
  const ProcessWindow({Key key,this.expanded=false}) : super(key: key);

  @override
  _ProcessWindowState createState() => _ProcessWindowState();
}

class _ProcessWindowState extends State<ProcessWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      expanded: widget.expanded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Processes',
            style: AppTextStyles.themedHeader,
          ),
          Container(
            height: widget.expanded? AppSizes.screenHeight(context) * 0.55: AppSizes.screenHeight(context) * 0.25,
            child: ListView.separated(
              itemCount: 6,
              separatorBuilder: (context,index){
                return Divider(height: 5,color: AppColors.appGreen.withOpacity(0.5),);
              },
                itemBuilder: (context, index) {
                  return Container(
                    height: 90.sp,
                    width: widget.expanded? AppSizes.screenWidth(context) * 0.8:AppSizes.screenWidth(context) * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Bypassing IP:',
                                style: AppTextStyles.macroText),
                            TextSpan(text: ' 127.90.43.03 ${index + 1}', style: AppTextStyles.macroText,)
                          ])),

                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Status:',
                                style: AppTextStyles.macroText),
                            TextSpan(text: ' Complete', style: AppTextStyles.macroText)
                          ])),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Time left:',
                                style: AppTextStyles.macroText),
                            TextSpan(text: ' 10:30', style: AppTextStyles.macroText)
                          ])),
                            SizedBox(
                              height: 5,
                            ),
                            LinearPercentIndicator(
                              width: AppSizes.screenWidth(context) * 0.3,
                              lineHeight: 8.0.sp,
                              percent: 0.5.sp,
                              backgroundColor: Colors.black,
                              progressColor: AppColors.appGreen,
                            ),
                            SizedBox(height: 5.sp,)
                          ],
                        ),
                        Visibility(
                          visible: widget.expanded, 
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Button(height: 30.sp,width: 80.sp,text: 'Stop',),
                              Button(height: 30.sp,width: 80.sp,text: 'Speed up',),
                            ],
                          )
                          ),
                          
                      ],
                    ),
                    
                  );
                }),
          ),
        ],
      ),
      height:widget.expanded? AppSizes.screenHeight(context) * 0.6: AppSizes.screenHeight(context) * 0.3,
      width: widget.expanded? AppSizes.screenWidth(context) * 0.9:AppSizes.screenWidth(context) * 0.36,
    );
  }
}
