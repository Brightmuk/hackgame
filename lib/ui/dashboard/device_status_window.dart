import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/ui/device.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DeviceStatusWindow extends StatefulWidget {
  const DeviceStatusWindow({Key key}) : super(key: key);

  @override
  _DeviceStatusWindowState createState() => _DeviceStatusWindowState();
}

class _DeviceStatusWindowState extends State<DeviceStatusWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      onTap: (){
        showCupertinoDialog(
        context: context,
        builder: (context) =>DeviceScreen());
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Device status',
            style: AppTextStyles.themedHeader,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: AppSizes.screenWidth(context) * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularPercentIndicator(
                      radius: AppSizes.screenWidth(context) * 0.1,
                      lineWidth: 3.0,
                      percent: 0.9,
                      center: Text(
                        "90%",
                        style: AppTextStyles.normalText,
                      ),
                      progressColor: AppColors.appRed,
                      backgroundColor: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LV.4 Hardware',
                          style: AppTextStyles.miniText,
                        ),
                        Text(
                          'Perfect',
                          style:
                              AppTextStyles.themedText,
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: AppSizes.screenWidth(context) * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularPercentIndicator(
                      radius: AppSizes.screenWidth(context) * 0.1,
                      lineWidth: 3.0,
                      percent: 0.6,
                      center: Text(
                        "60%",
                        style: AppTextStyles.normalText,
                      ),
                      progressColor: AppColors.appOrange,
                      backgroundColor: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LV.4 Software',
                          style: AppTextStyles.miniText,
                        ),
                        Text(
                          'Perfect',
                          style:
                              AppTextStyles.themedText,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.1,
      width: AppSizes.screenWidth(context),
    );
  }
}
