import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fooddelivery_app/api.dart';
import 'package:fooddelivery_app/Cart.dart';

class Cart2 extends StatefulWidget {
  final String imageUrl;
  final String name;

  const Cart2({super.key,required this.imageUrl,required this.name});
  @override

  State<Cart2> createState() => _Cart2State();

}
class _Cart2State extends State<Cart2> {

  Networking net=Networking();
  int selected=1;
  List<int> numbers=[1,2,3,4,5,6,7,8,9,10];
  String? imageUrl;
  String? name;

  @override
  // void initState() {
  //   super.initState();
  //   loadcartitem();
  // }
  // Future<void>loadcartitem() async{
  //   SharedPreferences prefs= await SharedPreferences.getInstance();
  //   String? cartjson=prefs.getString('cartitem');
  //   if(cartjson!=null)
  //   {
  //     Map<String,dynamic> cartdata=jsonDecode(cartjson);
  //     setState(() {
  //       print(cartdata['image'],);
  //       print(cartdata['name']);
  //     });
  //
  //   }
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15,top: 40),
        child: Column(
          children: [
            Container(
              width: 330,
              height: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
              child: Container(
                margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(image: NetworkImage(imageUrl!),width: 140,height: 150,)),
                          SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Text("55 % off ₹350",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 20),),
                              Row(
                                children: [
                                  Text(" select quantity",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  SizedBox(width: 10,),
                                  DropdownButton<int>(
                                    value:selected,
                                    dropdownColor: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5),
                                    items: numbers.map((int number) {
                                      return DropdownMenuItem<int>(
                                        value: number,
                                        child: Text(number.toString()),
                                      );
                                    }).toList(), onChanged: (int? value) {
                                    setState(() {
                                      selected=value!;
                                    });
                                  },),
                                ],
                              ),
                              Text("delivery date:",style: TextStyle(fontSize:15),),
                              Text("21 thursday 2.00 PM")
                            ],
                          ),
                        ],
                      ),
                      Text("${name!}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
                            ),
                              onPressed: () {
                          }, child: Text("Place the order",style: TextStyle(),)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
                              ),
                              onPressed: () {
                              }, child: Text("Remove from cart",style: TextStyle(),))
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
