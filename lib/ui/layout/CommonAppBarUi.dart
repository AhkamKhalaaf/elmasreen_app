 import 'package:flutter/material.dart';


 AppBar commonAppBarUi (String textValue,BuildContext context )
 {
   return  AppBar(backgroundColor:Colors.white,elevation:3.0,
     shadowColor: Colors.grey.withOpacity(0.25),titleSpacing: 0.0,
     iconTheme: IconThemeData(color:Colors.black),  automaticallyImplyLeading: false,
     leading: Builder(
       builder: (BuildContext context) {
         return  IconButton(icon:Icon(Icons.arrow_back_ios,
           color:Theme.of(context).accentColor, ), onPressed:(){
           Navigator.of(context).pop();
         });
       },
     ),
     centerTitle: true,title: Text(textValue
       ,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline5,),);

 }


