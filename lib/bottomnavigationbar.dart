import 'package:flutter/material.dart';
import 'package:fooddelivery_app/Add%20to%20cart.dart';
import 'package:fooddelivery_app/Cart.dart';
import 'package:fooddelivery_app/mainscreen.dart';
import 'package:fooddelivery_app/modelclass.dart';
import 'package:fooddelivery_app/quick scan.dart';

class bottombar extends StatefulWidget {

  bottombar({super.key,});

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  var currentindex=0;


  @override
  Widget build(BuildContext context) {
    final List<Widget> pages=[
      page4(),
      QRViewExample(),
      Cart2(),

    ];
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.grey,
              currentIndex: currentindex,
              onTap: (value) {
                setState(() {
                  currentindex=value;
                });
              },
              items:
              [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home',),
                BottomNavigationBarItem(icon: Icon(Icons.qr_code),label: 'scan'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'cart'),
              ]),
        ),
      ),
      body: pages[currentindex],

    );
  }
}
