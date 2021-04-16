import 'package:challenge/coin/models/SimpleCoin.dart';
import 'package:challenge/config/state/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/cupertino.dart';

class FetchTabWidget extends StatefulWidget {
  @override
  _FetchTabWidgetState createState() => _FetchTabWidgetState();
}

class _FetchTabWidgetState extends State<FetchTabWidget> {
  List<SimpleCoin> _coins;
  Provider state;
  TextEditingController _controller = TextEditingController();
  SimpleCoin _coin = SimpleCoin(
    id: "",
    name: "",
    symbol: "",
  ); //id , symbol y name

  @override
  Widget build(BuildContext context) {
    _coins = Provider.of<MyState>(context).coins.cast<SimpleCoin>();

    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20),
              child:
                  Text("Search for a crypto to add into your Saved Coins tab",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: _controller,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.italic),
                        decoration: InputDecoration(
                            hintText: "Find a crypto",
                            border: OutlineInputBorder())),
                    suggestionsCallback: (pattern) async {
                      print(
                        _controller.text, //toma el input todo:delete not needed
                      );
                      return _coins.where((SimpleCoin element) {
                        if (element.name
                            .toLowerCase()
                            .contains(pattern.toLowerCase())) {
                          return true;
                        } else {
                          return false;
                        }
                      });
                    },
                    itemBuilder: (context, SimpleCoin suggestion) {
                      return ListTile(
                        leading: Icon(Icons.monetization_on_sharp),
                        title: Text(suggestion.name),
                        subtitle: Text('\$${suggestion.symbol}'),
                      );
                    },
                    onSuggestionSelected: (SimpleCoin suggestion) {
                      _controller.text = suggestion.name;
                      _coin = suggestion;
                    },
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _addCoin();
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_addCoin() async {
  //todo: Metodo para guardar una moneda
  //todo: Guardar la crypto y ordenar por alpha
  //todo: Condicion para mostrar la snackBar
  //todo: Metodo para limpiar los campos _clearField

  _clearField() {
    // _coin.id = "";
    // _coin.symbol = "";
    // _coin.name = "";
    // // _coin.marketData.currentPrice = "";
    // _controller.text = "";
  }
}
