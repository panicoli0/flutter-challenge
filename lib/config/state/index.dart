// import 'package:challenge/coin/models/SimpleCoin.dart';
import 'package:challenge/coin/models/Coin.dart';
import 'package:flutter/foundation.dart';

class MyState extends ChangeNotifier {
  // Read https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple for more info

  // Define here the objects which state will be managed by the provider
  final List<Coins> _coins = <Coins>[];

  // Define the update functions

  List<Coins> get coins => _coins;

  set coins(List<Coins> coins) {
    _coins.addAll(coins);
    notifyListeners();
  }

  updateCoins() {
    notifyListeners();
  }
}
