import 'package:elmasreenapp/core/models/IntroSliderrModel.dart';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/HomePageUI.dart';
import 'package:elmasreenapp/ui/LoadingUi.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Values.dart';
import 'layout/NoProductFoundUI.dart';

class IntroSliderUI extends StatefulWidget {
  @override
  _IntrodSliderUIState createState() => _IntrodSliderUIState();
}

class _IntrodSliderUIState extends State<IntroSliderUI> {
  //getSliderItems
  int currentIndex = 0;
  SwiperController _controler = new SwiperController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backintro.png'),
              fit: BoxFit.fill)),
      child: Consumer<AccountProvider>(builder: (context,accountProvider,widgetUi){return
       FutureBuilder(future: accountProvider.getSliderItems('getIntrSliders'),builder: (context,snapShot){
         if(snapShot.hasData)
           {
            // print('${snapShot.data},,,,,,sasa');
             List<OneSlider> items =snapShot.data;
             if(items.length>0)
               {
                 return  Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       Expanded(flex: 2, child: SizedBox()),
                       Expanded(
                           flex:7,
                           child: Swiper(
                             autoplay: true,
                             loop: false,
                             autoplayDisableOnInteraction: true,
                             index: currentIndex,
                             controller: _controler,
                             onIndexChanged: (index) {
                               setState(() {
                                 currentIndex = index;
                               });
                             },
                             pagination: SwiperPagination(
                                 builder: DotSwiperPaginationBuilder(
                                     activeColor:
                                     Theme.of(context).primaryColor,
                                     color:
                                     Theme.of(context).accentColor )),
                             itemCount:items.length,
                             autoplayDelay: 4000,
                             itemBuilder: (context, index) {
                               return Padding(
                                 padding: EdgeInsets.only(
                                     left: MediaQuery.of(context).size.width * 0.05,
                                     right: MediaQuery.of(context).size.width * 0.05),
                                 child: Center(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         FadeInImage.assetNetwork(
                                             placeholder:'assets/images/looding.gif',
                                             fit: BoxFit.fill,
                                             image: items[index].image),

                                         SizedBox(height: 5.0,),
                                         Text(
                                           items[index].title.toString()!=''? items[index].title.toString():'',
                                           style: TextStyle(
                                               color: Theme.of(context).accentColor,
                                               fontWeight: FontWeight.bold),
                                         ),
                                         SizedBox(height: 5.0,),
                                         Text(
                                           items[index].text.toString()!=''? items[index].text.toString():'',
                                           style:
                                           TextStyle(color: Theme.of(context).accentColor),
                                         ),
                                         Expanded(flex: 1, child: SizedBox()),

                                         ButtonUi(doubleValue: MediaQuery.of(context).size.width *0.9,
                                           backColor: Theme.of(context).accentColor,
                                           widget:  Text(DemoLocalizations.of(context).title['btn_skip']
                                             ,style: TextStyle(color:skipColorText,
                                                 fontWeight: FontWeight.bold),),
                                           function: ()async {
                                             SharedPreferences sh=await SharedPreferences.getInstance();
                                             sh.setString('showslider', 'done');
                                             Navigator.pushReplacement(
                                                 context, MaterialPageRoute(builder: (BuildContext context)
                                             => HomePageUI()));
                                           },
                                         ),
                                         Expanded(flex: 1, child: SizedBox()),
                                       ],
                                     )),
                               );
                             },
                           )),
                       Expanded(flex: 1, child: SizedBox())
                     ],
                   ),
                 );
               }
             else
               {
                return NoProductFoundUI();}
           }
         return LoadingUi();
       });
      }),
    )));
  }
}
