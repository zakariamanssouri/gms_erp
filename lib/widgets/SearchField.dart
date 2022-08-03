import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/global_params.dart';

class SearchField extends StatefulWidget {
  final Size size;
  final void Function(String)? onchanged_function;

  SearchField({Key? key, required this.size, this.onchanged_function})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController controller;
  late void Function(String)? onchanged_function;
  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    onchanged_function = widget.onchanged_function;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.size.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: GlobalParams.MainPadding),
      padding: EdgeInsets.symmetric(horizontal: GlobalParams.MainPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: onchanged_function,
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIconColor: Colors.blue,
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                controller.text = "";
              });
            },
          ),
        ),
      ),
    );
  }
}
