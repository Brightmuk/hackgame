import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';

class ActivityLoggerWindow extends StatefulWidget {
  const ActivityLoggerWindow({Key key}) : super(key: key);

  @override
  _ActivityLoggerWindowState createState() => _ActivityLoggerWindowState();
}

class _ActivityLoggerWindowState extends State<ActivityLoggerWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity logger',
            style: AppTextStyles.themedHeader,
          ),
          Container(
            height: AppSizes.screenHeight(context) * 0.25,
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      'Running software checks...',
                      style: AppTextStyles.normalText,
                      maxLines: null,
                    ),
                  );
                }),
          ),
        ],
      ),
      height: AppSizes.screenHeight(context) * 0.3,
      width: AppSizes.screenWidth(context) * 0.6,
    );
  }
}
