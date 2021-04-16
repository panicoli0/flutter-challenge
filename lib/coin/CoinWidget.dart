import 'package:challenge/coin/widgets/tab/FetchTabWidget.dart';
import 'package:challenge/coin/widgets/tab/SavedTabWidget.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatefulWidget {
  @override
  _CoinWidgetState createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text("Crypto Coin Ticker"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Fetch Coin"),
              ),
              Tab(
                child: Text("Saved Coins"),
              ),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              FetchTabWidget(),
              SavedTabWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
