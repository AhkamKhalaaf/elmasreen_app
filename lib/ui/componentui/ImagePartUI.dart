import 'package:flutter/material.dart';
class ImagePartUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width*0.05),
      child: Image.asset(
        'assets/images/fulllogo.png',
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.45,
      ),
    );
  }
}
