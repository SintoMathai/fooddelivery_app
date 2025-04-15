import 'package:flutter/material.dart';
class Cartprovider with ChangeNotifier{
  List<Cartitem> _cartitems=[];
  List<Cartitem> get cartitems=>_cartitems;

}

class Cartitem {
}