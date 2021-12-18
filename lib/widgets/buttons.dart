import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/text_styles.dart';

class Button extends StatefulWidget {
  final Function onTap;
  final bool miniButton;
  final Function onDrag;
  final double width;
  final double height;
  final String text;
  final Widget icon;

  const Button(
      {Key key,
      this.onDrag,
      this.onTap,
      this.miniButton=false,
      this.height = 50,
      this.width = 100,
      this.text,
      this.icon
      })
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: widget.width,
              height: widget.height,
              child: widget.icon==null? Center(
                  child: Text(
                widget.text,
                style: widget.miniButton?AppTextStyles.normalText.copyWith(fontSize: 10):
                 AppTextStyles.normalText,
              )):Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                widget.icon,
                SizedBox(width: 10,),
                Text(
                widget.text,
                style: widget.miniButton?AppTextStyles.normalText.copyWith(fontSize: 10):
                 AppTextStyles.normalText,
              )
              ],),
              color: AppColors.fadedWhite,
              padding: EdgeInsets.all(5),
            ),
          ),
          Positioned(
              child: Container(
            width: widget.width / 10,
            height: 2,
            color: AppColors.appGreen,
          )),
          Positioned(
              left: 0,
              child: Container(
                width: 2,
                height: widget.height / 3,
                color: AppColors.appGreen,
              )),
          Positioned(
              right: 0,
              child: Container(
                width: 2,
                height: widget.height / 3,
                color: AppColors.appGreen,
              )),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: widget.width / 10,
                height: 2,
                color: AppColors.appGreen,
              )),
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: widget.width / 10,
                height: 2,
                color: AppColors.appGreen,
              )),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 2,
                height: widget.height / 3,
                color: AppColors.appGreen,
              )),
          Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 2,
                height: widget.height / 3,
                color: AppColors.appGreen,
              )),
          Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: widget.width / 10,
                height: 2,
                color: AppColors.appGreen,
              )),
        ],
      ),
    );
  }
}

