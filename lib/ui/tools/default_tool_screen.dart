import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/assets_images.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/input_decoration.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/style_widgets.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/models/tools.dart';
import 'package:hackgame/services/tools_service.dart';

class DefaultToolScreen extends StatefulWidget {
  final Tool tool;
  const DefaultToolScreen({Key key,this.tool}) : super(key: key);

  @override
  _DefaultToolScreenState createState() => _DefaultToolScreenState();
}

class _DefaultToolScreenState extends State<DefaultToolScreen> {

  bool _enabled;

  void initState(){
    super.initState();

    _enabled=widget.tool.meta['enabled']??true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enable',style: AppTextStyles.normalThickText,),
              CupertinoSwitch(
                activeColor: AppColors.appGreen,
                value: _enabled, 
                onChanged: (val){
                  ToolsService(toolId: widget.tool.id).enableDisableTool(val);
                  setState(()=>_enabled=val);
                }
                ),
            ],
          )
      ],
    );
  }
}
