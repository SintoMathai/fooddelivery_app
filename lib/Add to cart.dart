import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooddelivery_app/Cart.dart';
import 'package:fooddelivery_app/api.dart';
import 'dart:async';

import 'package:fooddelivery_app/data_model.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  int id;
   Cart({super.key, required this.id});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _isInit = true;
  Networking net=Networking();
  int totalSeconds = 3600;
  Timer? timer;
  String get formattedTime {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<Addressprovider>(builder: (context, value, child) => Scaffold(
      body: Center(
        child: FutureBuilder(future: net.singleuser(widget.id), builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image:
                    NetworkImage("${snapshot.data?.image}"),fit: BoxFit.fill)),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("${snapshot.data?.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${snapshot.data?.instructions}",style: TextStyle(fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Delivery address:",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(value.Addresses),
                  ElevatedButton(
                      onPressed: () {
                      }, child: Text("change",style: TextStyle(color: Colors.blueGrey),)),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Free delivery with in",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text(formattedTime,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
                  SizedBox(width: 5,),
                  Text("21 wendesday")
                ],
              ),
              Spacer(),
              Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity-10,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black),
                  child: Center(child: InkWell(
                      onTap: () async
                      {
                        if(snapshot.hasData&&snapshot.data!=null) {
                          final imageurl = snapshot.data!.image;
                          final name = snapshot.data!.name;
                          Map<String, dynamic> data = {
                            "name": name,
                            "image": imageurl
                          };
                          DataModel.instance.insert({
                            'data':jsonEncode(data)
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart2(),));
                        }
                      },
                      child: Text("ADD TO CART",style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)))))
            ],
          );
        },),
      ),
    ));
  }
}







