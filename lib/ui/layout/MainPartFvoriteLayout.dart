import 'package:dotted_border/dotted_border.dart';
import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
 import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:elmasreenapp/ui/LoadingUi.dart';
import 'package:elmasreenapp/ui/componentui/AddToCartButtonUi.dart';
import 'package:elmasreenapp/ui/layout/NoDataFoundLayout.dart';
import 'package:elmasreenapp/ui/widgets/FavoriteCartWidgetItem.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Values.dart';
import '../DetailsOneItemProductUi.dart';
import '../HomePageUI.dart';
class MainPartFavoriteLayout extends StatefulWidget {
  @override
  _MainPartFavoriteLayoutState createState() => _MainPartFavoriteLayoutState();
}

class _MainPartFavoriteLayoutState extends State<MainPartFavoriteLayout> {
  CartProvider cartProvider;
  init()async
  {
    await Future.delayed(Duration(milliseconds: 100));
    cartProvider=Provider.of<CartProvider>(context,listen:false);
    cartProvider.getAllFavorite();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: dataUi(context),
    );
  }

  Widget dataUi(BuildContext context)
  {
    //  List<CartLDBModel>
    return Consumer<CartProvider>(builder: (context,cartProvider,widget){
      return FutureBuilder(future: cartProvider.itemsFavorite,
          builder: (context,snapData){
        if(snapData.hasData)
          {List<CartLDBModel>items=snapData.data;
            return items.length>0?ListView.builder(itemCount:items.length,itemBuilder: (context,index){

            return Consumer<CategoryProvider>(builder: (context,catProvider,widgetUi){return
              GestureDetector(onTap: ()async{

                //  getProductFunction
                catProvider.emptyOneItemProductDetails();
                 catProvider.getProductFunction(items[index].itemId).then((value){
                   if(catProvider.oneItemProductDetails!=null)
                   {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (BuildContext context)
                     => DetailsOneItemProductUi(oneProductModel: catProvider.oneItemProductDetails,function: (){
                       cartProvider.getAllFavorite();
                     },)));
                   }
                 });


              },
                child: FavoriteCartWidgetItem(isSelected: 1, property: SizedBox(),height: 100.0,
                  widgetTop: GestureDetector(child:ImageIcon(AssetImage('assets/icons/deleteicon.png'),
                    color: Colors.red,),
                    onTap: () {
                      showBottomSheetFunction(context,(){
                        cartProvider.deleteFavorite(items[index].itemId);



                        Navigator.of(context).pop();

                      });
                    },
                  ),widget:
                AddToCartButtonUi(note: '',quantity: 1,widget: Container(
                  width: MediaQuery.of(context).size.width*0.25,
                  padding: EdgeInsets.only(left:5.0,right: 5.0,top: 5.0,bottom: 5.0),alignment: Alignment.center
                  ,child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Colors.white,size: 12.0,),
                    SizedBox(width:3.0,),
                    Text(DemoLocalizations.of(context).title['addtoCart'],
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.normal,fontSize: 10.0),),

                  ],
                ),decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(5.0)),)
                    ,oneProductModel:
                    catProvider.oneItemProductDetails),
                  title:items[index].title,
                  quantity: items[index].quantity,
                  description: items[index].description,
                  imgUrl: items[index].img,
                  idProduct: items[index].itemId,
                  price: items[index].price,oldPrice:items[index].oldPrice ,
                  type: 'fav',),
              );
            });
          }):noData(context);}
        return LoadingUi();


      })
      ;
    });
  }

  Widget noData(BuildContext context)
  {
    return
      NoDataFoundLayout(spaceOrNot: true,imagePath: 'assets/images/nofavorite.png',
        title: DemoLocalizations.of(context).title['nofavorite'],
      widget: GestureDetector(onTap: (){

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            HomePageUI()), (Route<dynamic> route) => false);
      },
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          child: Container(padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),alignment:Alignment.center
            ,width: MediaQuery.of(context).size.width *0.6,
            child: Text(DemoLocalizations.of(context).title['shopnow']), ),
        ),
      ));
  }
}
