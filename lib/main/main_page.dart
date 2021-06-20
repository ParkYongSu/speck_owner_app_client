import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:speck_owner_app/settings/settings_page.dart';
import 'package:speck_owner_app/ui/ui_color.dart';
import 'package:speck_owner_app/ui/ui_criteria.dart';
import 'dart:ui' as ui;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UICriteria _uiCriteria = new UICriteria();
  List<Shadow> _shadow = [Shadow(color: Colors.white.withOpacity(0.31), blurRadius: 3, offset: Offset(0,3))];

  String _today;

  @override
  void initState() {
    super.initState();
    _today = "Today ${DateTime.now().month}.${DateTime.now().day} (${_getWeekday(DateTime.now().weekday)})";
  }

  @override
  Widget build(BuildContext context) {
    _uiCriteria.init(context);

    return _mainPage();
  }

  Widget _mainPage() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR 코드 페이지",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("assets/png/main_background.png", fit: BoxFit.fill,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/png/main_draw.png"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding, vertical: _uiCriteria.totalHeight * 0.0714),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  appBar(),
                  Spacer(flex: 230,),
                  _infoWidget1(),
                  Spacer(flex: 100,),
                  _infoWidget2(),
                  Spacer(flex: 620,),
                  _titleSpeck(),
                  Spacer(flex: 155,),
                  _qrCode(),
                  Spacer(flex: 160,),
                  _triangleIcon(),
                  Spacer(flex: 230,),
                  _qrScanText(),
                  Spacer(flex: 2325,),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding, vertical: _uiCriteria.totalHeight * 0.0123),
                  child: Image.asset("assets/png/main_logo.png")),
            )
          ],
        ),
      ),
    );
  }

  /// 실제 앱바 위젯은 아니지만 앱바 위치에 있는 위젯
  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(_today, style: TextStyle(color: Colors.white, fontSize: _uiCriteria.textSize20, fontWeight: FontWeight.w700),),
        _settingsButton()
      ],
    );
  }

  /// 설정페이지로 가는 버튼
  Widget _settingsButton() {
    return GestureDetector(
      onTap: _settingTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.024, vertical: _uiCriteria.screenWidth * 0.016),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(85),
          color: greyD8D8D8.withOpacity(0.19),
        ),
        child: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(color: greyD8D8D8, fontSize: _uiCriteria.textSize10, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                children: <TextSpan>[
                  TextSpan(text: "B16Z - "),
                  TextSpan(text: "구독중 ", style: TextStyle(color: Colors.white))
                ]
              ),
            ),
            Icon(Icons.arrow_forward_ios_sharp, color: greyD8D8D8, size: _uiCriteria.textSize10,)
          ],
        ),
      ),
    );
  }
  
  /// 예정 출석자. 현재 출석자, 카페이름 
  Widget _infoWidget1() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
                style: TextStyle(shadows: _shadow, color: Colors.white, fontSize: _uiCriteria.textSize20, fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(text: "예정 출석자 "),
                  TextSpan(text: "102", style: TextStyle(color: Color(0XFFFCF3B2))),
                  TextSpan(text: "명"),
                ]
            ),
          ),
          Text("이 행성의 이름은", style: TextStyle(
              shadows: _shadow,
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize16),)
        ]
    );
  }

  Widget _infoWidget2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
              style: TextStyle(shadows: _shadow, color: Colors.white, fontSize: _uiCriteria.textSize20, fontWeight: FontWeight.w700),
              children: <TextSpan>[
                TextSpan(text: "현재 출석자 "),
                TextSpan(text: "12", style: TextStyle(color: Color(0XFFFCF3B2))),
                TextSpan(text: "명"),
              ]
          ),
        ),
        Text("스펙카페", style: TextStyle(shadows: _shadow, color: Colors.white, fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize22),)
      ],
    );
  }

  Widget _titleSpeck() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.2085),
      child: AspectRatio(
        aspectRatio: 186.2/34,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.black,
              boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.06), blurRadius: 6, spreadRadius: 0, offset: Offset(0, 3))]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText("집밖 출석체크 앱, 스펙",
                maxLines: 1,
                style: TextStyle(shadows: _shadow, color: Colors.white,
                    fontSize: _uiCriteria.textSize14, letterSpacing: 0.7, fontWeight: FontWeight.w700),),
              Image.asset("assets/png/main_logo_star.png")
            ],
          ),
        ),
      ),
    );
  }

  /// QR Code
  Widget _qrCode() {
    return  Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle  ,
        boxShadow: [BoxShadow(color: Color(0XFFa9b5ff).withOpacity(0.1), blurRadius: 60, spreadRadius: 50, offset: Offset(0, 3))]
      ),
      child: Container(
        alignment: Alignment.center,
        width: _uiCriteria.screenWidth * 0.5653,
        height: _uiCriteria.screenWidth * 0.5653,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0XFF707070), width: 1),
            color: mainColor
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return Container(
              width: constraint.maxWidth * 0.8419,
              height: constraint.maxWidth * 0.8419,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: QrImage(
                data: "naver.com",
                version: QrVersions.auto,
                size: double.infinity,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _triangleIcon() {
    return Container(
        width: _uiCriteria.screenWidth * 0.0533,
        height: _uiCriteria.screenWidth * 0.032,
        child: Image.asset("assets/png/triangle_icon.png", fit: BoxFit.fill));
  }

  Widget _qrScanText() {
    TextStyle textStyle = new TextStyle(shadows: _shadow, color: Colors.white, fontSize: _uiCriteria.textSize15, fontWeight: FontWeight.w700,);
    return Column(
      children: <Widget>[
        Text("QR코드를 스캔해", style: textStyle,),
        SizedBox(height: _uiCriteria.totalHeight * 0.0049,),
        Text("출석을 인증해주세요", style: textStyle,),
      ],
    );
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return "월";
      case 2:
        return "화";
      case 3:
        return "수";
      case 4:
        return "목";
      case 5:
        return "금";
      case 6:
        return "토";
      case 7:
        return "일";
    }
    return null;
  }

  void _settingTap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
  }

}
