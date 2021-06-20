import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speck_owner_app/main/main_page.dart';
import 'package:speck_owner_app/ui/public_widget.dart';
import 'package:speck_owner_app/ui/ui_color.dart';
import 'package:speck_owner_app/ui/ui_criteria.dart';

class MembershipPage extends StatefulWidget {
  @override
  _MembershipPageState createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  UICriteria _uiCriteria = new UICriteria();
  PageController _pageController = new PageController(initialPage: 0);

  int _pageIndex;
  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    _uiCriteria.init(context);
    return _membershipPage();
  }

  Widget _membershipPage() {
    return MaterialApp(
      title: "멤버십 정보 페이지",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: _uiCriteria.horizontalPadding, vertical: _uiCriteria.verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _title(),
                verticalSpacing12(),
                _benefit(),
                SizedBox(height: _uiCriteria.totalHeight * 0.0295,),
                _freeButton(),
                verticalSpacing12(),
                _priceInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      toolbarHeight: _uiCriteria.appBarHeight,
      elevation: 0,
      backgroundColor: mainColor,
      titleSpacing: 0,
      centerTitle: true,
      backwardsCompatibility: false,
      // brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: mainColor, statusBarBrightness: Brightness.dark),
      title: Text("스펙 멤버십 구독", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: _uiCriteria.textSize16),),
    );
  }

  Widget _title() {
    return Text("멤버십 혜택", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.bold, letterSpacing: 0.7),);
  }

  /// 멤버십 스와이핑 위젯
  Widget _benefit() {
    List<Widget> pages = <Widget>[
      _benefitContent(0, "방문자수/매출 상승", "출석을 하러 방문하는", "추가 고객 유입으로 매출 상승!", "assets/png/membership_draw1.png"),
      _benefitContent(1, "공간 홍보", "스펙 앱의 지도 기능을 통해", "학생들에게 공부할 수 있는 장소를 홍보!", "assets/png/membership_draw2.png"),
      _benefitContent(2, "시간대 마케팅 활용", "고객이 적은 특정 시간대에", "쿠폰/할인 마케팅으로 잔여 좌석을 활용!", "assets/png/membership_draw3.png"),
      _benefitContent(3, "매너시간 알림", "스펙 앱을 사용하는 카공족들에게", "매너시간(음료 재주문/자리양보) 알림!", "assets/png/membership_draw4.png")
    ];

    List<Widget> dots = List.generate(pages.length, (index) => _pageDot(index));

    return AspectRatio(
      aspectRatio: 343/399.7,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.9),
                  color: greyF5F5F6
                ),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return pages[index];
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.0600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: dots,
                ),
              )
            ],
          );
        },
      )
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  /// 멤버십 혜택 내용
  Widget _benefitContent(int index, String title, String content1, String content2, String image) {
    return Column(
      children: <Widget>[
        Spacer(flex: 230,),
        Text(title, style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize20, fontWeight: FontWeight.w700),),
        Spacer(flex: 220,),
        Text(content1, style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, fontWeight: FontWeight.w700),),
        Spacer(flex: 40,),
        Text(content2, style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize12, fontWeight: FontWeight.w700),),
        (index == 0)
        ? Spacer(flex: 110,)
        : (index == 1)
        ? Spacer(flex: 271,)
        : (index == 2)
        ? Spacer(flex: 396,)
        : Spacer(flex: 355,),
        Image.asset(image),
        (index == 0)
        ? Spacer(flex: 590,)
        : (index == 1)
        ? Spacer(flex: 746,)
        : (index == 2)
        ? Spacer(flex: 777,)
        : Spacer(flex: 637,)
      ],
    );
  }

  Widget _pageDot(int pageIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _uiCriteria.screenWidth * 0.0133),
      width: _uiCriteria.screenWidth * 0.0293,
      height: _uiCriteria.screenWidth * 0.0293,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (pageIndex == _pageIndex)?mainColor:Colors.white
      ),
    );
  }


  Widget _freeButton() {
    return AspectRatio(
      aspectRatio: 343/50,
      child: MaterialButton(
        onPressed: _free,
        elevation: 0,
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.5),
        ),
        child: Text("무료 체험하기", style: TextStyle(color: Colors.white, letterSpacing: 0.7, fontSize: _uiCriteria.textSize14, fontWeight: FontWeight.w700),),
      ),
    );
  }

  Widget _priceInfo() {
    return AspectRatio(
      aspectRatio: 343/50,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
          border: Border.all(color: mainColor)
        ),
        child: Text("1개월 무료 체험 이후 ￦5,500/월 (VAT 포함)", style: TextStyle(color: mainColor, fontSize: _uiCriteria.textSize14, letterSpacing: 0.7, fontWeight: FontWeight.w700),),
      ),
    );
  }


  void _free() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
  }
}
