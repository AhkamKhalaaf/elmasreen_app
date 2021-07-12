import 'package:dotted_border/dotted_border.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';

import '../AddAddressPageUi.dart';
class AddAddressUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
 

      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context)
      => AddAddressPageUi()));
    },
      child: DottedBorder(
        color: Colors.black,
        strokeWidth: 1,
        child: Container(padding: EdgeInsets.all(8.0),decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),alignment:Alignment.center,width: MediaQuery.of(context).size.width *0.5,
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add,color: Colors.black,)
,
              Text(DemoLocalizations.of(context).title['addaddress']),
            ],
          ), ),
      ),
    );
  }
}
