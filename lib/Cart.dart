import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fooddelivery_app/Payment.dart';
import 'package:fooddelivery_app/data_model.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:provider/provider.dart';

class Cart2 extends StatefulWidget {
  const Cart2({super.key});

  @override
  State<Cart2> createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  int selected = 1;
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  String? imageUrl;
  String? name;
  List<Map<String, dynamic>> cartItems = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<Cart>(context, listen: false).fetch();
  }

  void removeFromCart(int id) async {
    await DataModel.instance.delete(id);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context); // Get updated data
    final cartItems = cartProvider.cartItems;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 40),
          child: (cartItems.isEmpty)
              ? Text("cart is empty")
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartitem = cartItems[index];
                    return Container(
                      width: 330,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    cartitem['image'],
                                    width: 140,
                                    height: 150,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      "55 % off ₹350",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          " select quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(width: 10),
                                        DropdownButton<int>(
                                          value: selected,
                                          dropdownColor: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          items: numbers.map((int number) {
                                            return DropdownMenuItem<int>(
                                              value: number,
                                              child: Text(number.toString()),
                                            );
                                          }).toList(),
                                          onChanged: (int? value) {
                                            setState(() {
                                              selected = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Text("delivery date:",
                                        style: TextStyle(fontSize: 15)),
                                    Text("21 thursday 2.00 PM")
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              cartitem['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Payment(rate: selected),
                                        ));
                                  },
                                  child: Text("Place the order"),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      final itemid = cartitem['id'];
                                      Provider.of<Cart>(context, listen: false)
                                          .removeFromCart(itemid);

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                "item removed successfully"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    "ok",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ))
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text("Remove from cart")),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),

    );
  }
}
