import 'package:challenge/config/state/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'coin/CoinWidget.dart';
import 'config/widgets/SplashScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MyState>(
      create: (context) => MyState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          // Switch between the splash screen and the home screen here.
          SplashScreen(),
    );
  }
}
