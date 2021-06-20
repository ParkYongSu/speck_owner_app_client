import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speck_owner_app/signup/signup_page.dart';
import 'package:speck_owner_app/speck_membership/membership_info_page.dart';
import 'package:speck_owner_app/ui/public_widget.dart';
import 'package:speck_owner_app/ui/ui_color.dart';
import 'package:speck_owner_app/ui/ui_criteria.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UICriteria _uiCriteria = new UICriteria();
  final TextEditingController _idController = new TextEditingController();
  final TextEditingController _pwController = new TextEditingController();

  bool _idIsNotEmpty;
  bool _pwIsNotEmpty;

  @override
  void initState() {
    super.initState();
    _idIsNotEmpty = false;
    _pwIsNotEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    _uiCriteria.init(context);
    return _loginPage();
  }

  /// 로그인 페이지 위젯 모음
  Widget _loginPage() {
    return Scaffold(
      appBar: _appBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding, vertical: _uiCriteria.verticalPadding),
          child: Column(
            children: <Widget>[
              _textField("아이디", _idController, _idChanged, false,keyboardType: TextInputType.emailAddress),
              verticalSpacing12(),
              _textField("비밀번호", _pwController, _pwChanged, true,),
              _loginStateText(),
              _loginButton(),
              verticalSpacing12(),
              _askButton(),
              verticalSpacing11(),
              _bottomWidget()
            ],
          ),
        ),
      )
    );
  }

  /// 앱바
  Widget _appBar() {
    return AppBar(
      toolbarHeight: _uiCriteria.appBarHeight,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      backwardsCompatibility: false,
      // brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarBrightness: Brightness.light),
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.2464),
        alignment: Alignment.center,
        child: Image.asset("assets/png/login_logo.png"),
      ),
    );
  }

  /// 아이디, 비밀번호 텍스트필드
  Widget _textField(String hint, TextEditingController controller, Function(String value) onChanged,
      bool hide, {TextInputType keyboardType}) {
    TextStyle hintStyle = TextStyle(fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w500, letterSpacing: 0.7, color: greyB3B3BC);
    return AspectRatio(
      aspectRatio: 343/50,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: greyB3B3BC, width: 0.5),
          borderRadius: BorderRadius.circular(3.5),
        ),
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          cursorColor: mainColor,
          keyboardType: keyboardType,
          obscureText: hide,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.032),
            hintText: hint,
            hintStyle: hintStyle,
            // isDense: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _loginStateText() {
    return AspectRatio(
      aspectRatio: 343/36,
      child: Container(
        alignment: Alignment.center,
      ),
    );
  }

  /// 로그인 버튼
  Widget _loginButton() {
    return AspectRatio(
      aspectRatio: 343/50,
      child: MaterialButton(
        onPressed:
        (_idIsNotEmpty && _pwIsNotEmpty)
        ? _login
        : null,
        color: mainColor,
        disabledColor: greyD8D8D8,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.5)
        ),
        child: Text("로그인", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 0.7, fontSize: _uiCriteria.textSize14),),
      ),
    );
  }


  /// 상담 버튼
  Widget _askButton() {
    return AspectRatio(
      aspectRatio: 343/50,
      child: MaterialButton(
        onPressed: () {},
        color: mainColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.5)
        ),
        child: Text("무료 상담받기", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 0.7, fontSize: _uiCriteria.textSize14),),
      ),
    );
  }

  /// 비밀번호 찾기, 회원가입 버튼
  Widget _bottomButton(String text, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text, style: TextStyle(fontSize: _uiCriteria.textSize12, letterSpacing: 0.6, fontWeight: FontWeight.w500, color: greyB3B3BC),),
    );
  }

  /// 가장 아래에 위치한 위젯, 비번찾기, 회원가입 버튼
  Widget _bottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(flex: 725,),
        _bottomButton("비밀번호 찾기", _findPW),
        Spacer(flex: 300,),
        Container(width: 1, height: _uiCriteria.textSize12, color: greyB3B3BC,),
        Spacer(flex: 300,),
        _bottomButton("회원가입", _signUp),
        Spacer(flex: 985,),
      ],
    );
  }

  /// 아이디 입력시 동작
  void _idChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        _idIsNotEmpty = false;
      });
    }
    else {
      setState(() {
        _idIsNotEmpty = true;
      });
    }
  }

  /// 비밀번호 입력시 동작
  void _pwChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        _pwIsNotEmpty = false;
      });
    }
    else {
      setState(() {
        _pwIsNotEmpty = true;
      });
    }
  }

  /// 아이디, 비번 필드가 둘다 작성되어있을
  void _login() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MembershipPage()), (route) => false);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  /// 비밀번호 찾기 버튼 클릭시 동작
  void _findPW() {

  }

  /// 회원가입 버튼 클릭시 동작
  void _signUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}
