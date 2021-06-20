import 'package:flutter/material.dart';
import 'package:speck_owner_app/login/login_page.dart';
import 'package:speck_owner_app/ui/public_widget.dart';
import 'package:speck_owner_app/ui/ui_color.dart';
import 'package:speck_owner_app/ui/ui_criteria.dart';

class SignUpCompletePage extends StatelessWidget {
  final UICriteria _uiCriteria = new UICriteria();

  @override
  Widget build(BuildContext context) {
    _uiCriteria.init(context);
    return _signUpCompletePage(context);
  }

  Widget _signUpCompletePage(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "회원가입 완료",
      home: Scaffold(
        appBar: appBar(context, "회원가입"),
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: _uiCriteria.totalHeight * 0.039),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(flex: 138,),
                  _checkIcon(),
                  Spacer(flex: 23,),
                  _resultText(),
                  Spacer(flex: 24,),
                  _pwInfo(),
                  Spacer(flex: 12,),
                  _notice(),
                  Spacer(flex: 221,),
                ],
              ),
              _completeButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkIcon() {
    return Icon(Icons.check_circle_rounded, color: mainColor, size: _uiCriteria.screenWidth * 0.18,);
  }

  Widget _resultText() {
    TextStyle textStyle = new TextStyle(color: mainColor, fontSize: _uiCriteria.textSize18, fontWeight: FontWeight.w700, letterSpacing: 0.9);

    return Column(
      children: <Widget>[
        Text("사장님의 연락처로", style: textStyle,),
        SizedBox(height: _uiCriteria.totalHeight * 0.011),
        Text("전문 컨설턴트가 연락을 드릴 예정입니다.", style: textStyle,),
      ],
    );
  }
  
  Widget _pwInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
      child: AspectRatio(
        aspectRatio: 343/50,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.5),
            border: Border.all(color: greyB3B3BC, width: 0.5)
          ),
          child: Text("비밀번호는 컨설턴트와 상담 후에 발급됩니다!",
            style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize14, letterSpacing: 0.7, fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }

  Widget _notice() {
    TextStyle textStyle = new TextStyle(color: greyAAAAAA, fontSize: _uiCriteria.textSize10, letterSpacing: 0.5, fontWeight: FontWeight.w500);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("- 연락은 평일(공휴일 제외) 오전 9시부터 오후 6시 사이에 이루어집니다.", style: textStyle,),
        SizedBox(height: _uiCriteria.totalHeight * 0.0073,),
        Text("- 출석 인증장소에 적합한 곳인지 맞춤 상담 후에 비밀번호를 발급해드립니다.", style: textStyle,),
        SizedBox(height: _uiCriteria.totalHeight * 0.0073,),
        Text("- 상담원이 카카오톡으로 인증 장소에 관련된 정보를 취합할 예정입니다.", style: textStyle,),
        SizedBox(height: _uiCriteria.totalHeight * 0.0073,),
        Text("- 로그인을 하신 뒤에 스펙 서비스 구독이 가능합니다.(월 5,500원 - 첫달 무료)", style: textStyle,)
      ],
    );
  }

  Widget _completeButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
      child: AspectRatio(
        aspectRatio: 343/50,
        child: MaterialButton(
          onPressed: () => _complete(context),
          elevation: 0,
          color: mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5)
          ),
          child: Text("로그인 창으로 돌아가기", style: TextStyle(color: Colors.white, letterSpacing: 0.7, fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w700),),
        ),
      ),
    );
  }

  void _complete(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }
}
