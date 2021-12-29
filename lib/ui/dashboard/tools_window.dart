import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/models/tools.dart';
import 'package:hackgame/services/tools_service.dart';
import 'package:hackgame/ui/tools_screen.dart';
import 'package:hackgame/ui/single_exploit.dart';
import 'package:hackgame/widgets/buttons.dart';
import 'package:hackgame/widgets/buy_dialogue.dart';
import 'package:hackgame/widgets/window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolsWindow extends StatefulWidget {
  const ToolsWindow({Key key}) : super(key: key);

  @override
  _ToolsWindowState createState() => _ToolsWindowState();
}

class _ToolsWindowState extends State<ToolsWindow> {
  @override
  Widget build(BuildContext context) {
    return Window(
      onTap: (){
        showCupertinoDialog(
        context: context,
        builder: (context) =>ExploitsScreen());
      },
      content: Container(
        padding: AppSizes.topBottomPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Exploits',
              style: AppTextStyles.themedHeader,
            ),
            Container(
              height: AppSizes.screenHeight(context) * 0.25,
              child: StreamBuilder<List<Tool>>(
                stream: ToolsService().getUserTools,
                builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                          CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(AppColors.appGreen),
                          );
                    }
                    if(snapshot.hasData){
                      return ToolList(tools: snapshot.data,);
                    }else{
                      return Text('Error',style: AppTextStyles.miniText,);
                    }
                }
              ),
            ),
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
                            text: 'You own:',
                            style: AppTextStyles.normalThickText),
                        TextSpan(text: ' 44', style: AppTextStyles.themedHeader)
                      ])),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Available:',
                            style: AppTextStyles.normalThickText),
                        TextSpan(text: ' 43', style: AppTextStyles.themedHeader)
                      ])),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      height: AppSizes.screenHeight(context) * 0.4,
      width: AppSizes.screenWidth(context) * 0.54,
    );
  }
}

class ToolList extends StatelessWidget {
  final List<Tool> tools;
  const ToolList({ Key key,this.tools }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(tools.length>1){
      return ListView.builder(
          itemCount: tools.length,
          itemBuilder: (context, index) {
            Tool tool =tools[index];
            return Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Icon(
                      Icons.computer_outlined,
                      color: AppColors.appGreen,
                    ),
                  Text(
                    tool.name,
                    style: AppTextStyles.normalText,
                  ),
                  SizedBox(width: 40.sp,),
                  Button(
                    miniButton: true,
                  height: 25.sp,
                  width: 60.sp,
                  text: 'LAUNCH',
                  onTap: (){

                    showCupertinoDialog(
                    context: context,
                    builder: (context) =>SingleExploitScreen());
                    
                  },
                  ),
                ],
              ),
            );
          });
    }else{
      return Center(child: Text('No tools',style: AppTextStyles.miniText,));
    }

  }
}