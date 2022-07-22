import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Size size;
  final void Function(String)? onchanged_function;

  SearchField({Key? key, required this.size, this.onchanged_function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.09,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(246, 190, 185, 185),
                blurRadius: 25,
                spreadRadius: 5,
                offset: Offset(20, 20))
          ]),
      child: TextField(
        onChanged: onchanged_function,
        decoration: InputDecoration(
            hintText: "Search",
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: Icon(Icons.search),
            suffixIconColor: Colors.blue),
      ),
    );
  }
}