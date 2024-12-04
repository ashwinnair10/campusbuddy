// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget{
  Function func=(){};
  Searchbar(Function f, {super.key}){
    func=f;
  }

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _controller=TextEditingController();

  String query="";

  void setQuery(){
    setState((){
      query=_controller.text;
      widget.func(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: setQuery,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: _controller,
      cursorColor: Colors.grey.shade100,
      cursorHeight: 20,
      maxLines: 1,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxWidth: width-40,
          maxHeight: 40
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )
        ),
        fillColor: Colors.grey.shade700,
        focusColor: Colors.white,
        prefixIcon: const Icon(Icons.search,color: Colors.grey,),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )
        ),
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        contentPadding: const EdgeInsets.all(8)
      ),
    );
  }
}