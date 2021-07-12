import 'package:elmasreenapp/core/models/IntroSliderrModel.dart';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:elmasreenapp/ui/widgets/OneOfferWidgetItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DetailsOneItemProductUi.dart';
import '../LoadingUi.dart';
import 'NoProductFoundUI.dart';

class MainPartOfferLayout extends StatefulWidget {
  @override
  _MainPartOfferLayoutState createState() => _MainPartOfferLayoutState();
}

class _MainPartOfferLayoutState extends State<MainPartOfferLayout> {
  int currentIndex = 0;
  CategoryProvider categoryProvider;

  initCall() async {
    await Future.delayed(Duration(milliseconds: 100));
    categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.initScrollOffers();
    categoryProvider.getOffersFunction();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffF3F3F3),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
        ),
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            bottom: MediaQuery.of(context).size.width * 0.025),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<CategoryProvider>(
          builder: (context, categoryProvider, widgetUi) {
            return Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120.0,
                    color: Color(0xffF3F3F3),
                    child: Consumer<AccountProvider>(
                        builder: (context, accountProvider, widgetUi) {
                      return FutureBuilder(
                          future:
                              accountProvider.getSliderItems('getOfferSliders'),
                          builder: (context, snapShot) {
                            if (snapShot.hasData) {
                              List<OneSlider> items = snapShot.data;
                              if (items.length > 0) {
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      //CategoryProvider
                                      return Consumer<CategoryProvider>(builder:
                                          (context, categoryProvider, wigetUi) {
                                        return GestureDetector(
                                          onTap: () async {
                                            if (items[index].link != null) {
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
                                                                    categoryProvider
                                                                        .oneItemProductDetails,
                                                                function: () {},
                                                              )));
                                                }
                                              });
                                            }
                                          },
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: FadeInImage.assetNetwork(
                                                      placeholder:
                                                          'assets/images/loadingslid.gif',
                                                      fit: BoxFit.fill,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.75,
                                                      height: 120.0,
                                                      image:
                                                          items[index].image))),
                                        );
                                      });
                                    });
                              } else {
                                return NoProductFoundUI();
                              }
                            }
                            return SizedBox();
                          });
                    })),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: Container(
                    child: categoryProvider.loadingFullOffers
                        ? categoryProvider.itemsOffers.length > 0
                            ? Stack(
                                overflow: Overflow.visible,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: GridView.builder(
                                          controller: categoryProvider
                                              .scrollControllerOffers,
                                          shrinkWrap: true,
                                          primary: false,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 12.0,
                                                  crossAxisSpacing: 12.0,
                                                  childAspectRatio: 2.5 / 3),
                                          itemBuilder: (context, index) {
                                            return OneOfferWidgetItem(
                                              productsCategory: categoryProvider
                                                  .itemsOffers[index],
                                            );
                                          },
                                          itemCount: categoryProvider
                                              .itemsOffers.length,
                                        ),
                                      ),
                                      categoryProvider.loadingOffers
                                          ? SizedBox(
                                              height: 40.0,
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                  categoryProvider.loadingOffers
                                      ? Align(
                                          alignment: Alignment.bottomCenter,
                                          child: CircularProgressIndicator(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                          ))
                                      : SizedBox()
                                ],
                              )
                            : NoProductFoundUI()
                        : LoadingUi(),
                  ),
                )
              ],
            );
          },
        ));
  }
}
