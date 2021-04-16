import 'package:challenge/coin/CoinWidget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image(image: AssetImage("lib/assets/appLogo.png")),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 999), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return CoinWidget();
          },
        ),
      );
    });
  }
}
