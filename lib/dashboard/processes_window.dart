import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProcessWindow extends StatefulWidget {
  const ProcessWindow({Key key}) : super(key: key);

  @override
  _ProcessWindowState createState() => _ProcessWindowState();
}

class _ProcessWindowState extends State<ProcessWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Processes',
            style: AppTextStyles.themedHeader,
          ),
          Container(
            height: AppSizes.screenHeight(context) * 0.25,
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bypassing IP: 127.90.43.03 ${index + 1}',
                          style: AppTextStyles.normalText,
                        ),
                        Text(
                          'Status: Complete',
                          style: AppTextStyles.normalText,
                        ),
                        Text(
                          'Time left${index + 1}:0',
                          style: AppTextStyles.normalText,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LinearPercentIndicator(
                          width: AppSizes.screenWidth(context) * 0.3,
                          lineHeight: 8.0,
                          percent: 0.5,
                          backgroundColor: Colors.black,
                          progressColor: AppColors.appGreen,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.3,
      width: AppSizes.screenWidth(context) * 0.34,
    );
  }
}
