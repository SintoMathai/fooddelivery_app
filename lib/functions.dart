import 'package:flutter/material.dart';

Widget customTextField({required String hintText, IconData? prefixIcon,
required TextEditingController  controller,
bool obscuretext=false,}) {
  return TextField(
    controller: controller,
    obscureText: obscuretext,
    decoration: InputDecoration(
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Colors.black, size: 20)
          : null,
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[100],
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.grey,),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black, fontSize: 20),
    ),
    style: TextStyle(color: Colors.black),

    // To make entered text visible
  );
}
