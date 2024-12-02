import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle(){
    return   TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    );


  }
  static TextStyle headerTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }
  static TextStyle lightTextFieldStyle() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }
  static TextStyle semiBoldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }
}