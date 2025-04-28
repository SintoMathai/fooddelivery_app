import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery_app/bottomnavigationbar.dart';
import 'package:fooddelivery_app/mainscreen.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  final int rate;
  const Payment({super.key,required this.rate});
  @override
  State<Payment> createState() => _PaymentState();
}
class _PaymentState extends State<Payment> {
  String? gender;
  int? gst;
  int? value;
  int? total;
  bool showcontainer=false;
  void initState()
  {
    super.initState();
    value=widget.rate*250;
    gst=(value! *10~/100);
    total=gst!+value!;
  }
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<Addressprovider>(context).Addresses;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Row(children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10,top: 20),
                 child: Icon(CupertinoIcons.location),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 30,left: 20),
                 child: Text("Delivery to: $address", overflow: TextOverflow.ellipsis),
               ),
            ],),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                width: double.infinity-20,
                height: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text("Payment details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
                    Text("cost               :$value",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                    SizedBox(height: 10,),
                    Text("gst                 :$gst",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                    SizedBox(height: 10,),
                    Text("total amount:$total",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                  ],
                ),),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Select a payment method",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
                ListTile(
                  title: Text('Cash on delivery',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  leading: Radio(value: 'Cash on delivery', groupValue:gender, onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                      showcontainer = true;
                    });
                  },),
                trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(image: NetworkImage("https://www.marketing91.com/wp-content/uploads/2022/03/How-does-Cash-on-Delivery-Work-768x768.jpg"))),),
                SizedBox(height: 10,),
                ListTile(
                  title: Text('UPI payment method',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  leading: Radio(value: 'UPI payment method', groupValue:gender, onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                      showcontainer = true;
                    });
                    },),
                trailing: ClipRRect(borderRadius: BorderRadius.circular(40),
                child: Image(image: NetworkImage("https://cdn.iconscout.com/icon/free/png-256/free-upi-logo-icon-download-in-svg-png-gif-file-formats--unified-payments-interface-payment-money-transfer-logos-icons-1747946.png?f=webp")),),),
                SizedBox(height: 10,),
                ListTile(
                  title: Text('Debit card/Credit card payment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  leading: Radio(value: 'Debit card/Credit card payment', groupValue:gender, onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                      showcontainer = true;
                    });
                  },
                  ),
                trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(image: NetworkImage("https://images.goodreturns.in/img/2019/01/creditcard-23-1461389394-1547703670.jpg"))),),
                if(showcontainer)
                  InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text(("payment success")),
                          content: Text("payment completed"),
                          actions: [
                            TextButton(onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => bottombar(),));

                            }, child: Text("ok"))
                          ],
                        );
                      },);
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
                      height: 60,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      child: Center(child: InkWell(

                          child: Text("pay now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),))),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
