import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class KeyPhoneUi extends StatelessWidget {
//stateForm
  @override
  Widget build(BuildContext context) {
    return  Consumer<AccountProvider>(builder: (context,accountProvider,widgetUi){
      return Container(decoration: BoxDecoration(color: Colors.white,
        border: Border.all(color: !accountProvider.stateForm?Colors.red:Colors.grey.withOpacity(0.5),),
        borderRadius: BorderRadius.circular(8.0)),height: 48.0,alignment: Alignment.center,
      padding: EdgeInsets.only(left: 8.0,right:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('2+',style: TextStyle(fontSize:14.0),),
          SizedBox(width: 5.0,),
          Image.asset('assets/icons/EgyptFlag.png',width: 30.0,height: 30.0,),

        ],
      ),
    ) ;});
  }
}
//Container( height:48.0,padding: EdgeInsets.only(left: 5.0,right: 5.0),
//alignment: Alignment.center,decoration: BoxDecoration(
//border: Border.all(color:Colors.grey.withOpacity(0.5),width: 1.0)
//,borderRadius: BorderRadius.circular(5.0),
//color: Colors.white),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.center,children: [
//Icon(Icons.check,color: Colors.grey,),
//Text('+20',style: TextStyle(color: Colors.grey),)
//],))