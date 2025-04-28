import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class Addressprovider extends ChangeNotifier {
  String _address = "40179 Roy Pines,\n Kansas City,\nPennsylvania - 18484, Lesotho";
  String get Addresses => _address;
  void setaddress(String newaddress) {
    _address = newaddress;
    notifyListeners();

  }
}