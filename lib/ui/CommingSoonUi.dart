import 'package:flutter/material.dart';
class ComingSoonUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,children: [
       Image.asset('assets/images/backimage.png',width: MediaQuery.of(context).size.width * 0.75,
           height:MediaQuery.of(context).size.width * 0.75 ,),
        SizedBox(height: 25.0,),
        Text('جاري العمل علي هذة الشاشة',style: TextStyle(color: Colors.grey),)
      ],),
    );
  }
}
