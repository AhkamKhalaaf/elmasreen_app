import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
 import 'package:flutter/material.dart';
class PolicyTermsSideMenuUi extends StatelessWidget {
  final String title;
  final String body;

  const PolicyTermsSideMenuUi({Key key, this.title, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar:PreferredSize(child:  commonAppBarUi(title,
      context
    ),
        preferredSize: Size.fromHeight(50),),
    body: Container(padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.05)
      ,width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,children: [
          Image.asset('assets/images/fulllogo.png',width: MediaQuery.of(context).size.width * 0.5,

            height:  MediaQuery.of(context).size.width * 0.35,),
          SizedBox(height: 10.0,),
          Divider(color: Colors.grey.withOpacity(0.5),thickness: 1.0,),
          SizedBox(height: 10.0,),

          Text(body,style:  Theme.of(context).textTheme.headline2,textAlign: TextAlign.start,)
      ],),
        ),),),);
  }
}
