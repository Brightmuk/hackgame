import 'package:flutter/material.dart';
import 'package:hackgame/constants/assets_images.dart';
import 'package:hackgame/constants/colors.dart';
import 'package:hackgame/constants/sizes.dart';
import 'package:hackgame/constants/text_styles.dart';
import 'package:hackgame/widgets/window.dart';

class SnapScroll extends StatefulWidget {
  final List<Widget> items;
   SnapScroll({ Key key,this.items }) : super(key: key);

  @override
  _SnapScrollState createState() => _SnapScrollState();
}

class _SnapScrollState extends State<SnapScroll> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: AppSizes.screenHeight(context)*0.08,
          child: PageView.builder(
            itemCount: 5,
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: (index){
                setState(()=>current=index);
            },
            itemBuilder: (BuildContext context, int itemIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  height: AppSizes.screenHeight(context)*0.1,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    image: DecorationImage(
                      image: AssetImage(UserAssetImage.asset2)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              );
            },
          ),
        ),
        Text('${current+1}/20',style: AppTextStyles.miniText,),
      ],
    );
  }
}