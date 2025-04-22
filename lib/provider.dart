import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class Addressprovider extends ChangeNotifier {
  String _address = "";
  String get Addresses => _address;
  void setaddress(String newaddress) {
    _address = newaddress;
    notifyListeners();

  }

}