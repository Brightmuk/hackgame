import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/ui/contract_screen.dart';
import 'package:hackgame/widgets/snap_scroll.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContractsWindow extends StatefulWidget {
  const ContractsWindow({Key key}) : super(key: key);

  @override
  _ContractsWindowState createState() => _ContractsWindowState();
}

class _ContractsWindowState extends State<ContractsWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
            onTap: (){
      showCupertinoDialog(
        context: context,
        builder: (context) =>ContractScreen());
      },
      content: Container(
        padding: AppSizes.topBottomPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Contracts',
              style: AppTextStyles.themedHeader,
            ),
            SnapScroll(),
            Divider(
              color: Colors.grey[500],
              height: 1.sp,
            ),
            Container(
              padding: AppSizes.windowPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Bounty Contracts:',
                            style: AppTextStyles.normalThickText),
                        TextSpan(text: ' 4', style: AppTextStyles.themedHeader)
                      ])),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Other:',
                            style: AppTextStyles.normalThickText),
                        TextSpan(text: ' 4', style: AppTextStyles.themedHeader)
                      ])),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Ongoing:',
                            style: AppTextStyles.normalThickText),
                        TextSpan(text: ' 4', style: AppTextStyles.themedHeader)
                      ])),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      height: AppSizes.screenHeight(context) * 0.2,
      width: AppSizes.screenWidth(context) * 0.4,
    );
  }
}
