import 'package:challenge/coin/models/Coin.dart';
import 'package:challenge/coin/models/SimpleCoin.dart';
import 'package:challenge/config/ApiUrl.dart';
import 'package:challenge/config/ApiUrl.dart';
import 'package:http/http.dart' as http;

class CoinApiService {
  final url = "https://api.coingecko.com/api/v3";

  Future<List<SimpleCoin>> getListOfCoins() async {
    try {
      http.Response response =
          await http.get(Uri.parse("$url/coins/list?include_platform=false"));
      final body = response.body;
      final simpleCoin = simpleCoinFromJson(body);

      return simpleCoin;
    } catch (e) {
      print(e);
      return e.response;
    }

    // if (res.statusCode == 200) {
    //   final body = res.body;
    //   final simpleCoin = simpleCoinFromJson(body);
    //   return simpleCoin;
    // } else {
    //   final body = res.body;
    //   final error = simpleCoinFromJson(body);
    //   print(error);
    //   return error;
    // }
  }

  Future<List<Coins>> getCoinById(String coinId) async {
    try {
      http.Response response =
          await http.get(Uri.parse("$url/coins/" + coinId));
      final body = response.body;
      final coins = coinsFromJson(body);
      // final response = coins;
      // print(coins.length);
      return coins;
    } catch (e) {
      print(e);
      return e.response;
    }
  }
}
