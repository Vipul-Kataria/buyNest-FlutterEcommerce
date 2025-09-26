import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController mycontroller;
  final String hintText;
  const CustomTextField({super.key, required this.mycontroller,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: mycontroller,
        cursorColor: Colors.black38,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.black),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
