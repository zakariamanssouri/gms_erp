
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonWidget({
    Key? key,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.06,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.blue,
        onPressed: onPressed,
        child: Text(
          "Update",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
