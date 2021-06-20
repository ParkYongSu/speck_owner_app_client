import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speck_owner_app/ui/ui_color.dart';
import 'package:speck_owner_app/ui/ui_criteria.dart';

UICriteria uiCriteria = new UICriteria();

void uiInit(BuildContext context) {
  uiCriteria.init(context);
}

Widget greyBar() {
  return AspectRatio(
    aspectRatio: 375/11.8,
    child: Container(
      decoration: BoxDecoration(
          color: greyF0F0F1
      ),
    ),
  );
}

Widget appBar(BuildContext context, String title) {
  uiInit(context);
  return AppBar(
    elevation: 0,
    backgroundColor: mainColor,
    centerTitle: true,
    titleSpacing: 0,
    toolbarHeight: uiCriteria.appBarHeight,
    backwardsCompatibility: false,
    // brightness: Brightness.dark,
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: mainColor, statusBarBrightness: Brightness.dark),
    title: Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            width: uiCriteria.screenWidth,
            child: Text(title, style: TextStyle(letterSpacing: 0.8, color: Colors.white, fontWeight: FontWeight.w700, fontSize: uiCriteria.textSize16),)),
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
              child: Icon(Icons.chevron_left_rounded,
                  color: Colors.white, size: uiCriteria.screenWidth * 0.1),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      ],
    ),
  );
}

Widget loader(BuildContext context, int type) {
  uiInit(context);
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: (type == 0)?Colors.white:mainColor,
    ),
    width: uiCriteria.screenWidth,
    height: uiCriteria.totalHeight,
    child: Container(
      width: uiCriteria.screenWidth * 0.0666,
      height: uiCriteria.screenWidth * 0.0666,
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>((type == 0)?mainColor:Colors.white)
      ),
    ),
  );
}

Widget verticalSpacing12() {
  return SizedBox(height: uiCriteria.totalHeight * 0.0147,);
}

Widget verticalSpacing11() {
  return SizedBox(height: uiCriteria.totalHeight * 0.0135,);
}