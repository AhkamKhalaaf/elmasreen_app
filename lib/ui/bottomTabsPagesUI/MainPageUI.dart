 import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/models/IntroSliderrModel.dart';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:elmasreenapp/ui/layout/MainProductAndTitleLayout.dart';
import 'package:elmasreenapp/ui/layout/NoProductFoundUI.dart';
import 'package:elmasreenapp/ui/sidemenupages/NotificationSideMenuUi.dart';
import 'package:elmasreenapp/ui/widgets/gotoCartButton.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DetailsOneItemProductUi.dart';
import '../LoadingUi.dart';
import '../LoginPageUI.dart';

class MainPageUI extends StatefulWidget {
  final Function function;

  const MainPageUI({Key key, this.function}) : super(key: key);

  @override
  _MainPageUIState createState() => _MainPageUIState();
}

class _MainPageUIState extends State<MainPageUI> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
              centerTitle: true,titleSpacing: 00.0,
              title: Text(
                DemoLocalizations.of(context).title['main'],
                style: Theme.of(context).textTheme.headline5,
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/sidemenu.png'),
                    color: Colors.black,
                  ),
                  onPressed: () {
                    widget.function();
                  }),
              actions: [
                IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/icons/notification.png'),
                      size: 20.0,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      SharedPreferences sh =
                          await SharedPreferences.getInstance();

                      if (sh.getString('token') != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationSideMenuUi()),
                        );
                      } else {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPageUI()),
                            (Route<dynamic> route) => false);
                      }
                    }) ,
                GotoCart(),
                SizedBox(width: 10.0,)// )
              ]),
          preferredSize: Size.fromHeight(50.0)),
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Consumer<AccountProvider>(
            builder: (context, accountProvider, widgetUi) {
              return FutureBuilder(future: accountProvider
                  .getSliderItems('getHomeSliders'),
                builder: (context, snapShot) {

                  if (snapShot.hasData) {
                    List<OneSlider> items = snapShot.data;
                    return Column(
                      children: [
                      items.length > 0?
                        Container(
                          width:
                          MediaQuery.of(context).size.width,
                          height: 140.0,
                          color: Colors.white,
                          child: Swiper(
                            autoplay: true,
                            loop: false,
                            autoplayDisableOnInteraction: true,
                            index: currentIndex,
                            controller: SwiperController(),
                            onIndexChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            pagination: SwiperPagination(
                                builder:
                                DotSwiperPaginationBuilder(
                                    activeColor:
                                    Theme.of(context)
                                        .primaryColor,
                                    color: Theme.of(context)
                                        .accentColor)),
                            itemCount: items.length,
                            autoplayDelay: 4000,
                            itemBuilder: (context, index) {
                              //
                              return Consumer<CategoryProvider>(
                                  builder: (context,
                                      categoryProvider,
                                      widgetUi) {
                                    return GestureDetector(
                                        onTap: () async {
                                          if (items[index].link !=
                                              null) {
                                            categoryProvider
                                                .emptyOneItemProductDetails();
                                            categoryProvider
                                                .getProductFunction(
                                                items[index].link)
                                                .then((v) {
                                              if (categoryProvider
                                                  .oneItemProductDetails !=
                                                  null) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                        context) =>
                                                            DetailsOneItemProductUi(
                                                              oneProductModel:
                                                              categoryProvider.oneItemProductDetails,
                                                              function:
                                                                  () {},
                                                            )));
                                              }
                                            });
                                          }
                                        },
                                        child: ClipRRect(
                                          child: FadeInImage
                                              .assetNetwork(
                                              placeholder:
                                              'assets/images/loadingslid.gif',
                                              fit: BoxFit.fill,
                                              width:
                                              MediaQuery.of(
                                                  context)
                                                  .size
                                                  .width,
                                              height: 140.0,
                                              // image: '',
                                              image: items[index]
                                                  .image),
                                        ));
                                  });
                            },
                          ))
                   :
                      SizedBox()

                       , Consumer<CategoryProvider>(
                            builder: (context, categoryProvider, widgetUi) {
                          return FutureBuilder(future:categoryProvider
                              .getHomeCategoriesProducts(),
                              builder: (context,snapData){
                            //  print('${snapData.hasData},,,,homeproducts');
                            if(snapData.hasData)
                              {
                               // print('${snapData.data},,,,homeproducts');
                                List<HomeCategory> itemsData = snapData.data;
                                return Expanded(
                                child: SingleChildScrollView(
                                  child: itemsData.length > 0 ?  ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: itemsData.length,
                                      itemBuilder: (context, index) {
                                        if (itemsData[index]
                                            .products
                                            .data
                                            .length >
                                            0) {
                                          return MainProductAndTitleLayout(
                                            homeCategory: itemsData[index],
                                            topTitle: itemsData[index]
                                                .name
                                                .toString(),
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      })
                                      :Column(children: [
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                                    NoProductFoundUI()
                                  ],),
                                ),
                              );}
                            return Column(children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                              LoadingUi()
                            ],);
                          });
                        })
                      ],
                    );
                  }
                  return Container(
                      height: MediaQuery.of(context).size.width * 0.75,
                      child: LoadingUi());
                },
              );
            },
          )),
    );
  }
}
