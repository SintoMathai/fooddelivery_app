import 'package:flutter/material.dart';
import 'package:fooddelivery_app/loginpage.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _page1State();
}

class _page1State extends State<Intropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://img.freepik.com/premium-photo/big-tasty-home-made-burger-with-flying-ingredients-white-background-isolated_158023-1.jpg?semt=ais_hybrid"),fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Food is Love!\nand we are serving it up\ncome taste with passion!!",style: TextStyle(color: Colors.black,fontSize: 30,fontStyle: FontStyle.italic),),
              SizedBox(height: 5,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width-10,
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black),
                  child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold, ),)),

                ),
              )
            ],
          ),
        )
    );
  }
}
