import 'package:flutter/material.dart';
class TextCartUi extends StatelessWidget {
  final String title;

  const TextCartUi({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w100,
        color: Colors.black.withOpacity(0.75)),textAlign: TextAlign.center,);
  }
}
