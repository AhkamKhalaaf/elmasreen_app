import 'package:elmasreenapp/core/models/SubCategoriesModel.dart';
import 'package:flutter/material.dart';

import '../../Values.dart';
import '../CategoryMainUi.dart';
import '../SubCategoeryUi.dart';
class OneItemSubCategoryUI extends StatefulWidget {
  final SubCategory subCategory;

  const OneItemSubCategoryUI({Key key, this.subCategory}) : super(key: key);
  @override
  _OneItemSubCategoryUIState createState() => _OneItemSubCategoryUIState();
}

class _OneItemSubCategoryUIState extends State<OneItemSubCategoryUI> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(onTap: (){
      //CategoryMainUi
      widget.subCategory.hasSub==1? Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => SubCategoryUi( categoryId: widget.subCategory.id,
          title: widget.subCategory.name,)))
          :Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => CategoryMainUi(title:widget.subCategory.name,
          id: widget.subCategory.id,)));
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
                  fit: BoxFit.fill,width: MediaQuery.of(context).size.width * 0.5 -12,
                  image: widget.subCategory.image),),
          ),),
          Container(padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
            width: MediaQuery.of(context).size.width,decoration: BoxDecoration(color: Theme.of(context).primaryColor
                ,borderRadius: BorderRadius.only(bottomRight:Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0))),
            child: Text( widget.subCategory.name!=''? widget.subCategory.name:'',style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w300,fontSize: 12.0),textAlign: TextAlign.center,),
          ),


        ],),
    );
  }
}
