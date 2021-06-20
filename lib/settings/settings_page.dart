import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:speck_owner_app/ui/public_widget.dart';
import 'package:speck_owner_app/ui/ui_color.dart';
import 'package:speck_owner_app/ui/ui_criteria.dart';

class SettingPage extends StatelessWidget {
  final UICriteria _uiCriteria = new UICriteria();

  @override
  Widget build(BuildContext context) {
    _uiCriteria.init(context);

    return _settingPage(context);
  }
  
  Widget _settingPage(BuildContext context) {
    return MaterialApp(
      title: "설정 페이지",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(context, "내 설정"),
        backgroundColor: greyF0F0F1,
        body: Container(
          child: Column(
            children: <Widget>[
              _title("구독정보"),
              verticalSpacing11(),
              _subscribeContent(),
              _title("서비스 정보"),
              verticalSpacing11(),
              _serviceContent(),
              SizedBox(height: _uiCriteria.totalHeight * 0.0293,),
              _logout(context),
              SizedBox(height: _uiCriteria.totalHeight * 0.0073,),
              _withdraw(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: _uiCriteria.horizontalPadding,right: _uiCriteria.horizontalPadding ,top: _uiCriteria.verticalPadding),
      child: Text(title, style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, fontWeight: FontWeight.w700, letterSpacing: 0.6),),
    );
  }

  Widget _subscribeContent() {
    return AspectRatio(
      aspectRatio: 375/245,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: <Widget>[
            _userName(),
            _monthSubscribe(),
            _price(),
            _payment(),
          ],
        ),
      ),
    );
  }

  Widget _userName() {
    return Expanded(
      flex: 398,
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
        child: Text("홍길동님", style: TextStyle(color: mainColor, letterSpacing: 0.7, fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize14),),
      ),
    );
  }

  /// 월 정기구
  Widget _monthSubscribe() {
    return Expanded(
        flex: 805,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(flex: 108,),
                      Text("월 정기구독", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6),),
                      Spacer(flex: 100,),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("구독기간", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500),),
                              SizedBox(height: constraint.maxHeight * 0.0496,),
                              Text("다음 결제일", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Spacer(flex: 12,),
                          Column(
                            children: <Widget>[
                              Container(
                                width: 0.5,
                                height: _uiCriteria.textSize12,
                                color: greyD8D8D8,
                              ),
                              SizedBox(height: constraint.maxHeight * 0.0496,),
                              Container(
                                width: 0.5,
                                height: _uiCriteria.textSize12,
                                color: greyD8D8D8,
                              ),
                            ],
                          ),
                          Spacer(flex: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("2021.02.03 ~ 2021.12.31", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500),),
                              SizedBox(height: constraint.maxHeight * 0.0496,),
                              Text("2022.01.01", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Spacer(flex: 130,),
                        ],
                      ),
                      Spacer(flex: 108,)
                    ],
                  ),
                  _subscribeCancelButton(context)
                ],
              ),
            );
          },
        )
    );
  }

  /// 구독해지 버튼
  Widget _subscribeCancelButton(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 118,),
        GestureDetector(
          onTap: () => _showDialog(context, _subscribeCancelDialog(context)),
          child: Container(
            alignment: Alignment.center,
            width: _uiCriteria.screenWidth * 0.152,
            height:  _uiCriteria.screenWidth * 0.064,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(85),
                border: Border.all(color: greyB3B3BC)
            ),
            child: Text("구독 해지", style: TextStyle(color: greyAAAAAA, fontSize: _uiCriteria.textSize10, letterSpacing: 0.5),)
            ,
          ),
        ),
        Spacer(flex: 448,),
      ],
    );
  }

  /// 결제 금액
  Widget _price() {
    return  Expanded(
      flex: 615,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(flex: 108,),
            Text("결제 예정 금액", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6),),
            Spacer(flex: 100,),
            Text("5,500원", style: TextStyle(color: mainColor, fontWeight: FontWeight.w500, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6),),
            Spacer(flex: 108,),
          ],
        ),
      ),
    );
  }

  /// 결제 수단
  Widget _payment() {
    return  Expanded(
      flex: 615,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: greyD8D8D8,))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(flex: 108,),
            Text("결제 수단", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6),),
            Spacer(flex: 100,),
            Row(
              children: [
                Text("신한카드 5107", style: TextStyle(color: mainColor, fontWeight: FontWeight.w500, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6),),
                SizedBox(width: _uiCriteria.screenWidth * 0.0373,),
                GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Text("카드 변경 ", style: TextStyle(color: Color(0XFF2880eb), fontSize: _uiCriteria.textSize12, fontWeight: FontWeight.bold, letterSpacing: 0.6),),
                      Icon(Icons.arrow_forward_ios_outlined, color: Color(0XFF2880eb), size: _uiCriteria.textSize10,)
                    ],
                  ),
                )
              ],
            ),
            Spacer(flex: 108,),
          ],
        ),
      )
    );
  }

  /// 서비스 내용
  Widget _serviceContent() {
    return AspectRatio(
      aspectRatio: 375/111,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: <Widget>[
            _termsOfService(),
            _privacyPolicy(),
            _version()
          ],
        ),
      ),
    );
  }

  /// 서비스 내용 - 이용약관
  Widget _termsOfService() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("이용약관", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500),),
            Icon(Icons.arrow_forward_ios, color: greyB3B3BC, size: _uiCriteria.textSize12,)
          ],
        ),
      ),
    );
  }

  /// 서비스 내용 - 개인정보 처리방침
  Widget _privacyPolicy() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("개인정보 처리방침", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500),),
            Icon(Icons.arrow_forward_ios, color: greyB3B3BC, size: _uiCriteria.textSize12,)
          ],
        ),
      ),
    );
  }

  /// 서비스 내용 - 버전정보
  Widget _version() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: greyD8D8D8))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(color: mainColor, fontWeight: FontWeight.w500, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6),
                children: <TextSpan>[
                  TextSpan(text: "버전정보 "),
                  TextSpan(text: "4.4.9", style: TextStyle(color: greyAAAAAA))
                ]
              ),
            ),
            Row(
              children: <Widget>[
                Text("최신버전 ", style: TextStyle(color: greyAAAAAA, letterSpacing: 0.6, fontWeight: FontWeight.w500, fontSize: _uiCriteria.textSize12),),
                Icon(Icons.arrow_forward_ios, color: greyB3B3BC, size: _uiCriteria.textSize12,)
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 로그아웃
  Widget _logout(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDialog(context, _logoutDialog(context)),
      child: AspectRatio(
        aspectRatio: 375/37,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: greyD8D8D8)),
              color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("로그아웃", style: TextStyle(color: Color(0XFFE7535C), fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500),),
              Icon(Icons.arrow_forward_ios, color: greyB3B3BC, size: _uiCriteria.textSize12,)
            ],
          ),
        ),
      ),
    );
  }

  /// 회원탈퇴
  Widget _withdraw(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => _showDialog(context, _withdrawalDialog(context)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding),
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                // border: Border(bottom: BorderSide(color: greyAAAAAA, width: 0.5))
              ),
              child: Text("회원탈퇴",
                style: TextStyle(decorationThickness:1 ,decoration: TextDecoration.underline,
                    decorationColor: greyAAAAAA, color: greyAAAAAA, fontSize: _uiCriteria.textSize10, fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
    );
  }

  /// 구독 해지 클릭시 나타나는 다이얼로그
  Widget _subscribeCancelDialog(BuildContext context) {
    AlertDialog dialog = new AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.1666),
      content: AspectRatio(
        aspectRatio: 250/239,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.5)
          ),
          child: Column(
            children: <Widget>[
              _subscribeCancelDialogTitle(),
              _subscribeCancelDialogContent(context)
            ],
          ),
        ),
      ),
    );

    return dialog;
  }

  /// 구독해지 다이얼로그 제목
  Widget _subscribeCancelDialogTitle() {
    return Expanded(
      flex: 398,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
        ),
        child: Text("구독 해지 예약", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.bold, letterSpacing: 0.7),),
      ),
    );
  }

  /// 구독해지 다이얼로그 내용
  Widget _subscribeCancelDialogContent(BuildContext context) {
    return Expanded(
      flex: 1988,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return Column(
            children: <Widget>[
              Spacer(flex: 108,),
              AutoSizeText("스펙은 매주 다양한 기능을 추가하고 있습니다!", maxLines: 1,style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.bold),),
              Spacer(flex: 110,),
              Text("공간소유주님들에게 다양한 혜택을 드리고 있습니다.", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize10, fontWeight: FontWeight.w500, letterSpacing: 0.5),),
              Spacer(flex: 60,),
              Text("그래도 해지를 예약하시겠습니까?", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize10, fontWeight: FontWeight.w500, letterSpacing: 0.5),),
              Spacer(flex: 120,),
              Text("(지금 해지하셔도 21.06.02.까지 이용할 수 있습니다.)", style: TextStyle(color: greyAAAAAA, fontSize: _uiCriteria.textSize10, fontWeight: FontWeight.w500, letterSpacing: 0.5),),
              Spacer(flex: 120,),
              _subscribeContinueButton(context, constraint),
              Spacer(flex: 60,),
              _cancelReservationButton(constraint),
              Spacer(flex: 120,),
            ],
          );
        },
      ),
    );
  }

  /// 멤버십 구독 계속하기 버튼
  Widget _subscribeContinueButton(BuildContext context, BoxConstraints constraint) {
    return AspectRatio(
      aspectRatio: 226/39,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.048),
        child: MaterialButton(
          onPressed: () => _continue(context),
          elevation: 0,
          color: mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5)
          ),
          child: Text("멤버십 구독 계속하기", style: TextStyle(color: Colors.white, fontSize: _uiCriteria.textSize12, fontWeight: FontWeight.bold, letterSpacing: 0.6),),
        ),
      ),
    );
  }

  /// 다이얼로그에서 구독 해지 예약 버튼
  Widget _cancelReservationButton(BoxConstraints constraint) {
    return AspectRatio(
      aspectRatio: 226/39,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.048),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.5),
              border: Border.all(color: mainColor, width: 1)
          ),
          child: MaterialButton(
            onPressed: () {},
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5),
            ),
            child: Text("구독 해지 예약하기", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, fontWeight: FontWeight.bold, letterSpacing: 0.6),),
          ),
        ),
      ),
    );
  }

  /// 로그아웃 클릭시 나타나는 다이얼로
  Widget _logoutDialog(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.152),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0,
      content: Container(
        width: _uiCriteria.screenWidth,
        child: AspectRatio(
          aspectRatio: 260/105,
          child: Column(
            children: [
              _logoutDialogTitle(),
              _logoutDialogButtons(context)
            ],
          ),
        ),
      ),
    );
  }

  /// 로그아웃 다이얼로그 타이틀
  Widget _logoutDialogTitle() {
    return Expanded(
        flex: 619,
        child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
            ),
            alignment: Alignment.center,
            child: Text("정말 로그아웃하시겠어요?", style: TextStyle(letterSpacing: 0.7,color: mainColor, fontSize: _uiCriteria.screenWidth * 0.042, fontWeight: FontWeight.w700),)));
  }

  /// 로그아웃 다이얼 로그 2버튼
  Widget _logoutDialogButtons(BuildContext context) {
    return Expanded(
      flex: 371,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border(right: BorderSide(color: greyD8D8D8, width: 0.5))
                      ),
                      alignment: Alignment.center,
                      child: Text("취소", style: TextStyle(letterSpacing: 0.7, color: Color(0XFF3478F6), fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w700),)
                  )
              ),
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text("로그아웃", style: TextStyle(letterSpacing: 0.7, color: Color(0XFFe7535c), fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize14),))),
          ],
        ),
      ),
    );
  }

  /// 구독해지 다이얼로그에서 계쏙하기 버튼 클릭시
  void _continue(BuildContext context) {
    Navigator.pop(context);
  }

  void _showDialog(BuildContext context, Widget dialog) {
    showDialog(
        barrierColor: Colors.black.withOpacity(0.2),
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  Widget _withdrawalDialog(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.152),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0,
      content: Container(
        width: _uiCriteria.screenWidth,
        child: AspectRatio(
          aspectRatio: 260/122,
          child: Column(
            children: [
              Expanded(
                  flex: 82,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: greyD8D8D8, width: 0.5))
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(flex: 235,),
                          Text("정말 회원탈퇴하시겠어요?", style: TextStyle(letterSpacing: 0.7, color: mainColor, fontSize: _uiCriteria.screenWidth * 0.042, fontWeight: FontWeight.w700),),
                          Spacer(flex: 50),
                          Text("탈퇴시 모든 데이터는 삭제됩니다 ", style: TextStyle(letterSpacing: 0.5, color: greyAAAAAA, fontSize: _uiCriteria.textSize10, fontWeight: FontWeight.w700),),
                          Spacer(flex: 245,)
                        ],
                      ))),
              Expanded(
                flex: 39,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(right: BorderSide(color: greyD8D8D8, width: 0.5))
                                ),
                                alignment: Alignment.center,
                                child: Text("취소", style: TextStyle(letterSpacing: 0.7, color: Color(0XFF3478F6), fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w700),)
                            )
                        ),
                      ),
                      Expanded(
                          child: GestureDetector(
                            child: Container(
                                alignment: Alignment.center,
                                child: Text("회원탈퇴", style: TextStyle(letterSpacing: 0.7, color: Color(0XFFe7535c), fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize14),)),
                            onTap: () {},
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
