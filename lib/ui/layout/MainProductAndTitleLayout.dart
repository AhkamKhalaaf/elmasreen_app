import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/models/OneProductModel.dart';
import 'package:elmasreenapp/core/models/ProductsCategoryModel.dart';
import 'package:elmasreenapp/ui/widgets/OneItemProductUi.dart';
import 'package:flutter/material.dart';

import '../componentui/MainTitleUI.dart';
class MainProductAndTitleLayout extends StatelessWidget {
  final String topTitle;
  final HomeCategory homeCategory;

  const MainProductAndTitleLayout({Key key, this.topTitle, this.homeCategory}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return  Container(width: MediaQuery.of(context).size.width,color:Colors.white
      ,padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(height:10.0,),

        MainTitleUI(id:homeCategory.id ,title: topTitle ),
        SizedBox(height: 10.0,),
        Container(height: MediaQuery.of(context).size.width*0.6,
          child: ListView.builder(scrollDirection:Axis.horizontal,shrinkWrap: true,primary: false
              ,itemCount: homeCategory.products.data.length,itemBuilder: (context,index){
                return OneItemProductUi(productsCategory: homeCategory.products.data[index],);
              }),
        ),

      ],),);
  }
}
