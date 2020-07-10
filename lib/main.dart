import 'package:challenge/config/state/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _instructions = [
    "// Here goes the magic (remove all this and replace it with the actual code)",
    "- Before loading this page, there should be a splash screen.",
    "- In this page, add 2 tabs (Use a DefaultTabController), one for the fetching and one for the showing",
    "",
    "- The fetching tab should contain:",
    "- A TextInput to enter the symbol of the coin you want to fetch.",
    "- A button to execute the fetch operation.",
    "",
    "- The showing tab should contain:",
    "- Cards with the coins stored",
  ];

  /*
    Once the symbol has been validated, the data fetched through the API should be
    saved into a List of items inside the MyState class using the Provider protocol, then
    it should be stored locally using SharedPreferences.
    Note that it's important to repaint the screen and fetch data as little as possible,
    so use widgets like FutureBuilder and ListView.builder to ensure a good performance.
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Challenge"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              _instructions.join("\n\n"),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
