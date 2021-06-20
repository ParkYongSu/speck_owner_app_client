import 'dart:io';

import 'package:flutter/material.dart';

class UICriteria {
  double screenWidth; // 화면 너비
  double screenHeight; // 상태바, 네비바 제 높이
  double statusBarHeight; // 상태바 높이
  double naviHeight; // 네비바 높이
  double totalHeight; // 화면 높이
  double textSize16; // 제목1 텍스트 등 16
  double textSize14; // 제목2 텍스트 등 14
  double textSize12; // 세부정보 텍스트 사이즈 12
  double textSize18; // 18
  double textSize10; // 10
  double textSize20; // 20
  double textSize22;
  double textSize8;
  double textSize15;
  double horizontalPadding; // 가로 방향 패딩
  double verticalPadding; // 세로 방향 패
  double appBarHeight; // 앱바 높이

  void init(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    this.totalHeight = height;
    this.statusBarHeight = MediaQuery.of(context).padding.top;
    this.naviHeight = MediaQuery.of(context).padding.bottom;
    this.screenWidth = width;
    this.screenHeight = height - this.statusBarHeight - this.naviHeight;

    if (Platform.isAndroid) {
      this.textSize16 = height * 0.0197;
      this.textSize14 = height * 0.0172;
      this.textSize12 =  height * 0.0147;
      this.textSize18 =  height * 0.0222;
      this.textSize10 =  height * 0.0123;
      this.textSize20 = height * 0.0247;
      this.textSize8 = height * 0.0098;
      this.textSize22 = height * 0.0272;
      this.textSize15 = height * 0.0184;
    }
    else if (Platform.isIOS){
      this.textSize16 = width * 0.04266;
      this.textSize14 = width * 0.03733;
      this.textSize12 = width * 0.032;
      this.textSize18 = width * 0.048;
      this.textSize10 = width * 0.0266;
      this.textSize20 = width * 0.05333;
      this.textSize8 = width * 0.0213;
      this.textSize22 = width * 0.05866;
      this.textSize15 = width * 0.04;
    }

    this.horizontalPadding = width * 0.043;
    this.verticalPadding = height * 0.0283;
    this.appBarHeight = height * 0.067;
  }
}