import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController mycontroller;
  final String hintText;
  final int maxLines;
  const CustomTextField({
    super.key,
    required this.mycontroller,
    required this.hintText,
    this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: mycontroller,
        cursorColor: GlobalVariables.secondaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: GlobalVariables.secondaryColor),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Your $hintText";
          }
          return null;
        },
        maxLines: maxLines,
      ),
    );
  }
}
