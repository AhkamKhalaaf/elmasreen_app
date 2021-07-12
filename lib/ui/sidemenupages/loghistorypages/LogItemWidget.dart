import 'package:elmasreenapp/core/models/OrderUserModel.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class LogItemWidget extends StatelessWidget {
  final OrderProduct orderProduct;

  const LogItemWidget({Key key, this.orderProduct}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center
          ,children: [
          ClipRRect(borderRadius: BorderRadius.circular(8.0),
            child:FadeInImage.assetNetwork(
                placeholder:'assets/images/looding.gif',
                fit: BoxFit.cover,
                height:35.0,width: 35.0,
                image: orderProduct.image??''),
          ),
          SizedBox(width: 10.0,),
          Expanded(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text(orderProduct.name.toString(),style:Theme.of(context).textTheme.headline2),
            Text('${orderProduct.price.toString()} ${DemoLocalizations.of(context).title['currency']}'
                 ,style: TextStyle(
                fontSize: 10.0,color: Theme.of(context).primaryColor),),


          ],)),
          SizedBox(width: 15.0,)
,
          Row(
            children: [
             // Text('x1',style:Theme.of(context).textTheme.headline2),
              SizedBox(width: 15.0,),

              Icon(Icons.arrow_forward_ios,color: Colors.grey.withOpacity(0.75),size: 12.0,),
            ],
          ),
        ],),
        Divider(thickness: 1.0,color: Colors.grey.withOpacity(0.5),)

      ],
    );
  }
}
