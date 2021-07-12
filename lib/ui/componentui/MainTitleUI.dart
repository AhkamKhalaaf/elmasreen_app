import 'package:elmasreenapp/ui/CategoryMainUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class MainTitleUI extends StatelessWidget {
  final int id;
  final String title;

  const MainTitleUI({Key key, this.id, this.title}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
       Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context)
      => CategoryMainUi()));
    },child: Row(mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,children: [
        Text(title,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),
        SizedBox(width: 10.0,),

        Expanded(child: Container(height: 1.0,color:Colors.black,)),
        SizedBox(width: 10.0,),

        GestureDetector(onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (BuildContext context) =>
              CategoryMainUi(title:title,
            id: id,)));
        },
          child: Row(children: [
            Text(DemoLocalizations.of(context).title['more'],style: TextStyle(fontSize: 12.0,
                fontWeight: FontWeight.bold,color:Colors.black),),
            // Icon(Icons.double_arrow,color: Colors.red,size: 15.0,)
            SizedBox(width: 3.0,),
            ImageIcon(AssetImage('assets/icons/doublearrow.png'),size: 9.0,color:Colors.black)
          ],),
        )
    ],),);
  }
}
