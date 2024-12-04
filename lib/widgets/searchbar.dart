// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget{
  TextEditingController _controller=TextEditingController();

  Searchbar({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      cursorColor: Colors.grey.shade900,
      cursorHeight: 20,
      maxLines: 1,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxWidth: width-40,
          maxHeight: 40
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.transparent,
          )
        ),
        fillColor: Colors.grey.shade700,
        focusColor: Colors.white,
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.transparent,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.transparent,
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.transparent,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.transparent,
          )
        ),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        contentPadding: EdgeInsets.all(8)
      ),
    );
  }
}