import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooddelivery_app/functions.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _Page4State();
}

class _Page4State extends State<Signup> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  Future<User?> signUp() async {
    if (username.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmpassword.text.isNotEmpty) {
      if (password.text == confirmpassword.text) {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
          return credential.user;
        } on FirebaseAuthException catch (e) {
          print("Signup Error: ${e.message}");
          return null;
        }
      } else {
        print("Passwords do not match!");
        return null;
      }
    } else {
      print("All fields are required!");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://thumbs.dreamstime.com/b/tall-burger-many-toppings-including-lettuce-tomatoes-onions-cheese-piled-high-ingredients-creating-visually-351746512.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: customTextField(
                hintText: 'Username',
                prefixIcon: Icons.person,
                controller: username,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: customTextField(
                hintText: 'Email ID',
                prefixIcon: Icons.email_outlined,
                controller: email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: customTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                controller: password,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: customTextField(
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
                controller: confirmpassword,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  signUp();
                },
                child: Text(
                  "SIGNUP",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
