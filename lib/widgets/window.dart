import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
// import 'package:audioplayers/audioplayers.dart';

class Window extends StatefulWidget {
  final Function onTap;
  final Color color;
  final Function onDrag;
  final double width;
  final double height;
  final Widget content;
  final bool expanded;
  final bool expandable;

  const Window(
      {Key key,
      this.onDrag,
      this.expanded=false,
      this.expandable=false,
      this.color,
      this.onTap,
      this.height = 50,
      this.width = 200,
      this.content})
      : super(key: key);

  @override
  _WindowState createState() => _WindowState();
}

class _WindowState extends State<Window> {
  // AudioCache _audioCache;

  // void initState() {
  //   super.initState();
  //   _audioCache = AudioCache(
  //     prefix: 'assets/audio/',
  //     fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      // _audioCache.play('window-click.wav');
      widget.onTap();
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              child: Center(child: widget.content),
              color: widget.color??AppColors.fadedWhite,
              padding: EdgeInsets.all(5),
            ),
            Positioned(
                child: Container(
              width: widget.width / 8,
              height: 2,
              color: AppColors.appGreen,
            )),
            Positioned(
                left: 0,
                child: Container(
                  width: 2,
                  height: widget.width / 8,
                  color: AppColors.appGreen,
                )),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: widget.width / 8,
                  height: 2,
                  color: AppColors.appGreen,
                )),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  height: widget.width / 8,
                  color: AppColors.appGreen,
                )),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Visibility(
                    visible: widget.expanded,
                    child: IconButton(icon: Icon(Icons.close,color: AppColors.appGreen,),onPressed: (){Navigator.pop(context);},),
                  ),
                )

          ],
        ),
      ),
    );
  }
}

//To be used in future

class WindowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 5;
    var centerY = size.height / 8;
    var rectSize = Size(size.width / 2.8, size.height / 20);
    var center = Offset(centerX, centerY);
    var origin = Offset(0, 0);

    var rectBrush = Paint()
      ..color = AppColors.fadedWhite
      ..style = PaintingStyle.fill;

    var lineBrush = Paint()
      ..color = AppColors.appGreen
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawRect(origin & rectSize, rectBrush);
    canvas.drawLine(center, Offset(83, 130), lineBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
