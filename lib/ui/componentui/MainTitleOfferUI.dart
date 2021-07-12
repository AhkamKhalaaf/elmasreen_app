import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class MainTitleOfferUI extends StatelessWidget {
  final String title;

  const MainTitleOfferUI({Key key, this.title}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,children: [
        Text(title,style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold,color: Colors.black),),

        Expanded(child: SizedBox()),
        Row(children: [
          Text(DemoLocalizations.of(context).title['more'],style: TextStyle(fontSize: 12.0,
              fontWeight: FontWeight.bold,color:Colors.black),),
         // Icon(Icons.double_arrow,color: Colors.red,size: 15.0,)
          SizedBox(width: 3.0,),
           ImageIcon(AssetImage('assets/icons/doublearrow.png'),size: 9.0,color:Colors.black)
         ],)

      ],);
  }
}
