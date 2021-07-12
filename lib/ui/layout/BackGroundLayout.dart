import 'package:flutter/material.dart';
class BackGroundLayout extends StatelessWidget {
  final String pathImage;

  const BackGroundLayout({Key key, this.pathImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child: Image.asset(pathImage,
      width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,),
    );
  }
}
