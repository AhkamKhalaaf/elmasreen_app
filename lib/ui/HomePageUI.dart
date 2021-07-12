import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:elmasreenapp/ui/bottomTabsPagesUI/CartPageUi.dart';
import 'package:elmasreenapp/ui/bottomTabsPagesUI/CategoryPageUI.dart';
import 'package:elmasreenapp/ui/bottomTabsPagesUI/DrawerSideMenuUI.dart';
import 'package:elmasreenapp/ui/bottomTabsPagesUI/FavoritePageUi.dart';
import 'package:elmasreenapp/ui/bottomTabsPagesUI/MainPageUI.dart';
import 'package:elmasreenapp/ui/bottomTabsPagesUI/OffersPageUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePageUI extends StatefulWidget {
  @override
  _MainPageUIState createState() => _MainPageUIState();
}

class _MainPageUIState extends State<HomePageUI> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//refreshToken
  AccountProvider accountProvider;
  CartProvider cartProvider;
  CategoryProvider categoryProvider;
  init()async
  {
    await Future.delayed(Duration(milliseconds: 100));
    accountProvider=Provider.of<AccountProvider>(context,listen:false);
    cartProvider=Provider.of<CartProvider>(context,listen:false);
    categoryProvider=Provider.of<CategoryProvider>(context,listen:false);
    accountProvider.refreshToken();
    accountProvider.loginOrNotFunction();
    accountProvider.getSideMenuPages();
    cartProvider.getAboutApp();
    cartProvider.getAllProducts();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(key: _scaffoldKey,body: getCurrentIndex(_currentIndex),
        bottomNavigationBar: Container(  decoration: BoxDecoration( boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 3,
            offset:
            Offset(0,5), // changes position of shadow
          ),
        ],
            color: Colors.white,borderRadius: BorderRadius.circular(5.0)),width: MediaQuery.of(context).size.width,
          child: BottomNavigationBar(
           backgroundColor:Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor:Theme.of(context).primaryColor ,
          unselectedItemColor:Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // print('${index}index');
             });
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/iconhome.png')),
                title: Text(DemoLocalizations.of(context).title['main'])),

            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/sections.png')),
                title: Text(DemoLocalizations.of(context).title['sections'])),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/cart.png')),
                title: Text(DemoLocalizations.of(context).title['cart'])),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/offer.png')),
                title: Text(DemoLocalizations.of(context).title['Offers'])),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/favorite.png')),
                title: Text(DemoLocalizations.of(context).title['favorite'])),






          ]),
        ),
    drawer: DrawerSideMenuUI(),),
 );
  }

  Widget getCurrentIndex(int index  )
  {
    if(index==4)
    {
      //
      return FavoritePageUi(function: (){
        _scaffoldKey.currentState.openDrawer();
      },);
    }
    else if(index==3)
    {
       return OffersPageUi(function: (){
         _scaffoldKey.currentState.openDrawer();
       },);
    }
    else if(index==2)
    {
      return CartPageUi(function: (){
        _scaffoldKey.currentState.openDrawer();
      });
    }
    else if(index==1)
    {
      return CategoryPageUI( function: (){
        _scaffoldKey.currentState.openDrawer();
      });
    }
    else if(index==0)
    {
      return MainPageUI(function: (){
        _scaffoldKey.currentState.openDrawer();
      });
    }
  }
}
