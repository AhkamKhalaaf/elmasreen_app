 import 'package:flutter/material.dart';
class CommonAppBarTopUi extends StatelessWidget {
  final String title;
  final Function function;

  const CommonAppBarTopUi({Key key, this.title, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(color:Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 3,
            offset:
            Offset(0, 3), // changes position of shadow
          ),
        ],
      ),width: MediaQuery.of(context).size.width,height: 50.0,
      //Theme.of(context).primaryColor,
        child: Row(
          children: [
            IconButton(icon: ImageIcon(AssetImage('assets/images/sidemenu.png'),color: Colors.black,),
                onPressed: (){
                  function();

                }),
            Expanded(child:  Text(title
              ,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline5,)),
            SizedBox(width: 40.0,)
          ],
        ),);
  }
}



