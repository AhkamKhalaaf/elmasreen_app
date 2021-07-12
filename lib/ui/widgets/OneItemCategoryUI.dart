import 'package:elmasreenapp/core/models/CategoriesModel.dart';
import 'package:flutter/material.dart';

import '../../Values.dart';
import '../CategoryMainUi.dart';
import '../SubCategoeryUi.dart';
class
OneItemCategoryUI extends StatelessWidget {
  final MainCategory  category;

  const OneItemCategoryUI({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(onTap: (){
      //CategoryMainUi
     category.hasSub=='1'? Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => SubCategoryUi(
       categoryId: category.id,
       title: category.name,
     )))
     :Navigator.push(
         context, MaterialPageRoute(builder: (BuildContext context) => CategoryMainUi(
       title: category.name,
         id: category.id,
     )));
    },
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,children: [

          Expanded(child:Container(decoration: BoxDecoration(
          color:weightColorGrey,borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0),
            topRight: Radius.circular(8.0),)),
            child: ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0),
            topRight: Radius.circular(8.0),)
              ,child:FadeInImage.assetNetwork(
                  placeholder:'assets/images/looding.gif',
                  fit: BoxFit.cover,width: MediaQuery.of(context).size.width *0.5 -12,
                  image: category.image),),
          ),),
             Container(padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
               width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                   color: Theme.of(context).primaryColor
                 ,borderRadius: BorderRadius.only(bottomRight:Radius.circular(8.0),
                 bottomLeft: Radius.circular(8.0))),
              child: Text(category.name!=''?category.name:'',style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w300,fontSize: 12.0),textAlign: TextAlign.center,),
            ),


        ],),
    )
    ;
  }
}
