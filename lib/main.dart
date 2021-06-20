import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speck_owner_app/login/login_page.dart';
import 'package:speck_owner_app/ui/public_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(SpeckOwner());
}

class SpeckOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _splashActions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          }
          else {
            return Scaffold(
              body: loader(context, 0),
            );
          }
        },
      ),
    );
  }

  Future<Widget> _splashActions() async {
    return Future(() {
      return LoginPage();
    });
  }
}


