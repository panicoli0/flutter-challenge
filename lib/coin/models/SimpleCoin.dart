// To parse this JSON data, do
//
//     final simpleCoin = simpleCoinFromJson(jsonString);

import 'dart:convert';

List<SimpleCoin> simpleCoinFromJson(String str) =>
    List<SimpleCoin>.from(json.decode(str).map((x) => SimpleCoin.fromJson(x)));

String simpleCoinToJson(List<SimpleCoin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SimpleCoin {
  SimpleCoin({
    this.id,
    this.symbol,
    this.name,
  });

  String id;
  String symbol;
  String name;

  factory SimpleCoin.fromJson(Map<String, dynamic> json) => SimpleCoin(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
      };
}
