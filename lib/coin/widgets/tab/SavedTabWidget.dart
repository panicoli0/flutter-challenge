import 'package:challenge/coin/api/CoinApiService.dart';
import 'package:challenge/coin/models/SimpleCoin.dart';
import 'package:challenge/config/state/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedTabWidget extends StatefulWidget {
  @override
  _SavedTabWidgetState createState() => _SavedTabWidgetState();
}

class _SavedTabWidgetState extends State<SavedTabWidget> {
  //todo: create the currencySelectorDropdown
  MyState state;
  String dropdownValue = "usd";
  String cryptoTest = "bitcoin";

  @override
  Widget build(BuildContext context) {
    state = Provider.of<MyState>(context);
    return Container(
      child: FutureBuilder<List<SimpleCoin>>(
        future: CoinApiService().getListOfCoins(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final simpleCoinData = data[index];
                return Container(
                  child: Row(
                    children: [
                      // Text(coinData.name),
                      // Text(coinData.symbol),
                      Text(simpleCoinData.id),
                    ],
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  //todo: method to load coins from storage (sharedPref)

  //todo: methodo para recorrer la listOfCoinss

  //Todo: Create a method to listCoins

  //Todo: Create a method to refreshCoins

  //todo: Create a method to deleteCoins

}
