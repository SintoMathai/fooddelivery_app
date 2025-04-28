import 'package:flutter/material.dart';
import 'package:fooddelivery_app/bottomnavigationbar.dart';
import 'package:fooddelivery_app/functions.dart';
import 'package:fooddelivery_app/mainscreen.dart';
import 'package:fooddelivery_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _page2State();
}

class _page2State extends State<Login> {
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future<void>login() async
    {
      try{
        UserCredential credentials=await auth.signInWithEmailAndPassword(
            email: username.text,
            password: password.text
        );
        Navigator.push(context, MaterialPageRoute(builder:  (context) => bottombar(),));
      }

      catch(e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid username or password")));


      }}
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://thumbs.dreamstime.com/b/tall-burger-many-toppings-including-lettuce-tomatoes-onions-cheese-piled-high-ingredients-creating-visually-351746512.jpg"),fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: customTextField(
                  hintText:'username',prefixIcon: Icons.person,controller: username),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: customTextField(hintText:'password',prefixIcon:  Icons.lock,controller: password),
            ),
            TextButton(onPressed: () {
            }, child: Align(
              alignment: Alignment.bottomRight,
                child: Text("forgot password?",style: TextStyle(color: Colors.white),))),
            SizedBox(
              width: MediaQuery.of(context).size.width-20,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                  onPressed: () {
                    login();

              }, child: Text("LOGIN",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder:  (context) => Signup(),),);

              },
                child: Text("don't have an acoount?Sign up",style: TextStyle(color: Colors.white, fontSize: 15,),))

          ],
        ),
      ),

    );
  }
}
