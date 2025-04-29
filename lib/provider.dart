import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Addressprovider extends ChangeNotifier {
  String _address =
      "40179 Roy Pines,\n Kansas City,\nPennsylvania - 18484, Lesotho";
  String get Addresses => _address;
  void setaddress(String newaddress) {
    _address = newaddress;
    notifyListeners();
  }
}

class favour extends ChangeNotifier {
  Set<int> _favoriteItems = {};
  Set<int> get favoriteItems => _favoriteItems;

  void toggle(int id) {
    if (_favoriteItems.contains(id)) {
      _favoriteItems.remove(id);
    } else {
      _favoriteItems.add(id);
    }
    notifyListeners();
  }
  bool isFavorite(int id) {
    return _favoriteItems.contains(id);
  }
}
