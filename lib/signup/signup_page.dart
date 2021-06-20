import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:speck_owner_app/signup/signup_result.dart';
import 'package:speck_owner_app/ui/public_widget.dart';
import 'package:speck_owner_app/ui/ui_color.dart';
import 'package:speck_owner_app/ui/ui_criteria.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final UICriteria _uiCriteria = new UICriteria();
  final TextEditingController _pNumController = new TextEditingController();
  final TextEditingController _authNumController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _uiCriteria.init(context);

    return _signUpPage();
  }

  /// 회원가입 페이지 모든 위젯
  Widget _signUpPage() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"회원가입 페이지",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(context, "회원가입"),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            padding: EdgeInsets.fromLTRB( _uiCriteria.horizontalPadding, _uiCriteria.verticalPadding, _uiCriteria.horizontalPadding, _uiCriteria.totalHeight * 0.039),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _pNumTitle(),
                verticalSpacing12(),
                _inputArea(
                    _pNumFieldForm(_textField("-없이 숫자만 입력", _pNumController, _pNumChanged, 11, keyboardType: TextInputType.phone)),
                    _requestAuthNumButton()),
                verticalSpacing12(),
                _inputArea(
                    _authNumFieldForm(_textField("인증번호", _authNumController, _authNumChanged, 4, keyboardType: TextInputType.number) ),
                    _authenticateButton()),
                _completeButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 타이틀
  Widget _pNumTitle() {
    return Text("전화번호", style: TextStyle(fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w700, letterSpacing: 0.7, color: mainColor),);
  }

  /// 전화번호 입력 필드 & 인증번호 버튼, 인증번호 입력 필드 & 인증확인 버튼
  Widget _inputArea(Widget inputField, Widget button) {
    return AspectRatio(
      aspectRatio: 343/50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          inputField,
          button
        ],
      ),
    );
  }

  /// 전화번호 필드 테두리
  Widget _pNumFieldForm(TextField textField) {
    return AspectRatio(
      aspectRatio: 247/50,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: greyB3B3BC, width: 0.5),
          borderRadius: BorderRadius.circular(3.5)
        ),
        child: textField
      ),
    );
  }

  /// 인증번호 필드 테두리
  /// todo. 서버통신 후 수정
  Widget _authNumFieldForm(TextField textField) {
    return AspectRatio(
      aspectRatio: 247/50,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: greyB3B3BC, width: 0.5),
              borderRadius: BorderRadius.circular(3.5)
          ),
          child: textField
      ),
    );
  }

  /// 전화번호, 인증번호 필드
  Widget _textField(String hint, TextEditingController controller, Function(String value) onChanged,
      int maxLength ,{TextInputType keyboardType}) {
    TextStyle hintStyle = TextStyle(color: greyB3B3BC, letterSpacing: 0.7, fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w500);
    return TextField(
      onChanged: onChanged,
      cursorColor: mainColor,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.032),
        hintText: hint,
        hintStyle: hintStyle,
        border: InputBorder.none,
      ),
    );
  }

  /// 인증번호 요청 버튼
  Widget _requestAuthNumButton() {
    return AspectRatio(
      aspectRatio: 84/50,
      child: MaterialButton(
        onPressed: _requestAuthNum,
        disabledColor: greyD8D8D8,
        color: mainColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.5)
        ),
        child: AutoSizeText("인증요청", maxLines: 1, style: TextStyle(color: Colors.white, letterSpacing: 0.7, fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize14),),
      )
    );
  }

  /// 인증 확인 버튼
  /// todo. 서버통신 후 수
  Widget _authenticateButton() {
    return AspectRatio(
        aspectRatio: 84/50,
        child: MaterialButton(
          onPressed: _authenticate,
          disabledColor: greyD8D8D8,
          color: mainColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5)
          ),
          child: AutoSizeText("확인", maxLines: 1, style: TextStyle(color: Colors.white, letterSpacing: 0.7, fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize14),),
        )
    );
  }

  /// 확인 버튼
  Widget _completeButton() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 343/50,
            child: MaterialButton(
              onPressed: _complete,
              color: mainColor,
              disabledColor: greyD8D8D8,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.5)
              ),
              child: Text("확인", style: TextStyle(color: Colors.white, fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w700, letterSpacing: 0.7),),
            ),
          )
        ],
      ),
    );
  }

  void _pNumChanged(String value) {

  }

  void _authNumChanged(String value) {

  }

  void _requestAuthNum() {

  }

  void _authenticate() {

  }

  void _complete() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpCompletePage()));
  }
}
