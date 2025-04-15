import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooddelivery_app/Cart.dart';
import 'package:fooddelivery_app/api.dart';
import 'dart:async';

import 'package:fooddelivery_app/data_model%20(1).dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  int id;
   Cart({super.key, required this.id});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Networking net=Networking();
  int totalSeconds = 3600;
  // DataModel model=DataModel();

  Timer? timer;
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (totalSeconds > 0) {
        setState(() {
          totalSeconds--;
        });
      } else {
        timer.cancel(); // stop when time is over
      }
    });
  }

  String get formattedTime {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel(); // clean up timer
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text("40179 Roy Pines, Kansas City,\nPennsylvania - 18484, Lesotho"),
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
                          final imageurl=snapshot.data!.image;
                          final name=snapshot.data!.name;
                          // if(imageurl!=null&&name!=null)git
                          //   {
                              Map<String,dynamic> data={
                                "name":snapshot.data?.name,
                                "image":snapshot.data?.image,


                              };
                              DataModel.instance.insert(data);
                              // SharedPreferences prefer=await SharedPreferences.getInstance();
                              // Map<String,dynamic> cartitem={
                              //   'image':imageurl,
                              //   'name':name
                             // };
                              // prefer.setString('cartitem', jsonEncode(cartitem));
                            // }
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Cart2(imageUrl: imageurl,name:name),));
                        },
                        child: Text("ADD TO CART",style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)))))
              ],
            );
          },),
      ),
    );
  }
}







