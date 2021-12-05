import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';

class ActivityLoggerWindow extends StatefulWidget {
  final bool expanded;
  const ActivityLoggerWindow({Key key,this.expanded=false}) : super(key: key);

  @override
  _ActivityLoggerWindowState createState() => _ActivityLoggerWindowState();
}

class _ActivityLoggerWindowState extends State<ActivityLoggerWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      expanded: widget.expanded,
      onTap: (){
            showCupertinoDialog(
        context: context,
        builder: (context) => Container(
              child: Scaffold(
                  backgroundColor:
                      Colors.black.withOpacity(0.8),
                  body: Center(
                      child: ActivityLoggerWindow(
                    expanded: true,
                  ))),
            ));
      },
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
      height: widget.expanded?AppSizes.screenHeight(context) * 0.6: AppSizes.screenHeight(context) * 0.3,
      width:widget.expanded?AppSizes.screenWidth(context) * 0.9: AppSizes.screenWidth(context) * 0.58,
    );
  }
}
