import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/LoginPageUI.dart';
import 'package:elmasreenapp/ui/SignUpUI.dart';
import 'package:elmasreenapp/ui/sidemenupages/AboutSideMenu.dart';
import 'package:elmasreenapp/ui/sidemenupages/AddressSideMenuUi.dart';
import 'package:elmasreenapp/ui/sidemenupages/CategorySideMenuUI.dart';
import 'package:elmasreenapp/ui/sidemenupages/ContactUsSideMenuUI.dart';
import 'package:elmasreenapp/ui/sidemenupages/LogOrdersSideMenuUi.dart';
import 'package:elmasreenapp/ui/sidemenupages/MyAccountSideMenuUi.dart';
import 'package:elmasreenapp/ui/sidemenupages/NotificationSideMenuUi.dart';
import 'package:elmasreenapp/ui/sidemenupages/PolicyTermsSideMenuUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' show parse;
import '../../Values.dart';
class DrawerSideMenuUI extends StatefulWidget {
  @override
  _DrawerSideMenuUIState createState() => _DrawerSideMenuUIState();
}

class _DrawerSideMenuUIState extends State<DrawerSideMenuUI> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(color: Colors.white,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          width: MediaQuery.of(context).size.width *0.8,child:  Column(
        children: [
               Align(alignment: Alignment.topLeft,child: GestureDetector(onTap: (){
                Navigator.of(context).pop();
              },
                child: Icon(Icons.cancel,size: 30.0,color: Theme.of(context).accentColor,),)),
          Image.asset(
            'assets/images/fulllogo.png',
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.35,
          ),
            SizedBox(height:10.0,),

            Consumer<AccountProvider>(builder: (context,accountProvider,widget){

                return FutureBuilder(future: accountProvider.loginOrNotFunction(),builder: (context,snapData){
                  String user=snapData.data;
                //  print('${user},,,,,,,dfdfd');
                  return user!=''?userEntered(accountProvider.nameUser,accountProvider.imageUser,accountProvider.phoneUser):userNotLogIn();
                }) ;
              }),

                SizedBox(height: 10.0,),
  Container( padding: EdgeInsets.all(10.0)
        ,child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

                  itemDrawer((){
                    Navigator.of(context).pop();
                  },DemoLocalizations.of(context).title['homePage'],
    ImageIcon(AssetImage('assets/icons/iconhome.png'),color: iconSideMenuColor,size: 25.0)),


                   itemDrawer((){
                      Navigator.push(
                         context, MaterialPageRoute(builder: (BuildContext context)
                     => CategorySideMenuUI()));
                   },DemoLocalizations.of(context).title['department'],
                       ImageIcon(AssetImage('assets/icons/section.png'),
                           color: iconSideMenuColor,size: 25.0))
       ,

               Consumer<AccountProvider>(builder: (context,accountProvider,widget){
                 return FutureBuilder(future: accountProvider.loginOrNotFunction(),builder: (context,snapData){
                   String user = snapData.data;
                   return  itemDrawer((){
                 if(user!='')
                   { Navigator.push(
                       context, MaterialPageRoute(builder: (BuildContext context)
                   => MyAccountSideMenuUi()));}
                 else
                   {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (BuildContext context)
                     => LoginPageUI()));
                   }

                 },DemoLocalizations.of(context).title['myaccount'],
                       ImageIcon(AssetImage('assets/icons/myaccount.png'),
                           color: iconSideMenuColor,size: 25.0)) ;
                 });
               },),
//                itemDrawer((){
//                  //FavoriteSideMenuUi
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (BuildContext context)
//                  => FavoriteSideMenuUi()));
//                },DemoLocalizations.of(context).title['favorite'],'assets/icons/favorite.png'),
//                itemDrawer((){
//                  //CartSideMenuUi
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (BuildContext context)
//                  => CartSideMenuUi()));
//                },DemoLocalizations.of(context).title['shoppingCart'],'assets/icons/cart.png'),

        Consumer<AccountProvider>(builder: (context,accountProvider,widget){
          return FutureBuilder(future: accountProvider.loginOrNotFunction(),builder: (context,snapData){
            String user = snapData.data;
            return itemDrawer((){
             if(user!='')
               {     Navigator.push(
                   context, MaterialPageRoute(builder: (BuildContext context)
               => LogOrdersSideMenuUi()));
               }
             else
               {
                 Navigator.push(
                     context, MaterialPageRoute(builder: (BuildContext context)
                 => LoginPageUI()));
               }

            },DemoLocalizations.of(context).title['OrderHistory'],
                ImageIcon(AssetImage('assets/icons/log.png'),
                    color: iconSideMenuColor,size: 25.0)
            ) ;
          });
        },),


        Consumer<AccountProvider>(builder: (context,accountProvider,widget){
          return FutureBuilder(future: accountProvider.loginOrNotFunction(),builder: (context,snapData){
            String user = snapData.data;
            return  itemDrawer((){
              if(user!='')
                { Navigator.push(
                    context, MaterialPageRoute(builder: (BuildContext context)
                => AddressSideMenuUi()));}
              else
                {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (BuildContext context)
                  => LoginPageUI()));
                }

            },DemoLocalizations.of(context).title['Myaddresses'],
              //gps.png
              // Icon(Icons.location_on_outlined,size: 22.0,color:Color(0xff9b99a2)
              //Colors.grey.withOpacity(0.8)
              Padding(padding: EdgeInsets.only(left: 3.0,right: 3.0),
                child: ImageIcon(AssetImage('assets/icons/gps.png'),
                    color:Color(0xff9b99a2),size:18.0),
              ) ,) ;
          });
        },),
SizedBox(height: 5.0,),
//            itemDrawer((){
//
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (BuildContext context)
//              => NotificationSideMenuUi()));
//            },DemoLocalizations.of(context).title['notifications'],
//                //
//                Padding(padding: EdgeInsets.only(left: 3.0,right: 3.0),
//                  child: ImageIcon(AssetImage('assets/icons/notification.png'),
//                      color:Color(0xff9b99a2),size:18.0),
//                )
//                )

                ],),decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 3,
                        blurRadius:3,
                        offset:
                        Offset(0, 3), // changes position of shadow
                      ),
                    ],
        border: Border.all(width: 1.0,color: Colors.grey.withOpacity(0.25))
                    ,borderRadius: BorderRadius.circular(8.0)),) ,
                SizedBox(height: 10.0,),

               Container( padding: EdgeInsets.all(10.0),
                 child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  //itemDrawer((){},DemoLocalizations.of(context).title['paymentmethods'],
                 // 'assets/icons/payment.png'),
                 //aboutApp
                  Consumer<AccountProvider>(builder: (context,accountProv,widgetUi){
                    return ListView.builder(primary: false,shrinkWrap: true,itemCount: accountProv.pagesList.length
                        ,itemBuilder: (context,index){

                      return  itemDrawer((){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (BuildContext context)
                        => PolicyTermsSideMenuUi(title:accountProv.pagesList[index].title.toString(),
                            body:parse(parse(accountProv.pagesList[index].text).body.text).
                            documentElement.text.toString()

                        )));
                      },accountProv.pagesList[index].title.toString(),
                        ImageIcon(AssetImage('assets/icons/policy.png'),
                            color: iconSideMenuColor,size: 25.0),);
                    });
                  }),
//                  itemDrawer((){
//                    Navigator.push(
//                        context, MaterialPageRoute(builder: (BuildContext context)
//                    => PolicyTermsSideMenuUi(title: DemoLocalizations.of(context).title['conditions'],
//                      body: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربهذا النص هو مثال لنص يمكنيد هذا النص من مولد النص العربهذا النص هو مثال لنص يمكن'
//                      'يد هو مثال لنص يمكن'
//                      'يد هذا النص من مولد النص العربهذا النص هو مثال لنص يمكنيد هذا النص من مولد النص العربهذا النص هو مثال لنص يمكن'
//                    'يد هذا النص من مولد النص العربهذا النص هو مثال لنص يمكن'
//                    'يدبهذا النص هو مثال لنص يمكن '
//                    '')));
//                  },DemoLocalizations.of(context).title['conditions'],
//                      ImageIcon(AssetImage('assets/icons/terms.png'),
//                          color: iconSideMenuColor,size: 25.0)),
                 itemDrawer((){
                   Navigator.push(
                       context, MaterialPageRoute(builder: (BuildContext context)
                   => AboutSideMenu()));
                 },DemoLocalizations.of(context).title['aboutApp'],
                     ImageIcon(AssetImage('assets/icons/terms.png'),
                         color: iconSideMenuColor,size: 25.0))
                ],),decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 3,
                        blurRadius:3,
                        offset:
                        Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(width: 1.0,color:Colors.grey.withOpacity(0.25))
                    ,borderRadius: BorderRadius.circular(8.0)),),
                SizedBox(height: 10.0,),
                Container(padding: EdgeInsets.all(10.0),
                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
//            itemDrawer((){
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (BuildContext context)
//              => SettingsSideMenUi()));
//            },DemoLocalizations.of(context).title['settings'],'assets/icons/settings.png'),
//
//

                 //   itemDrawer((){},DemoLocalizations.of(context).title['lang'],'assets/icons/lang.png'),
                    itemDrawer((){
                      //
                      Navigator.push(
                          context, MaterialPageRoute(builder: (BuildContext context)
                      => ContactUsSideMenuUI()));
                    },DemoLocalizations.of(context).title['contact_us'],
                        ImageIcon(AssetImage('assets/icons/us.png'),
                            color: iconSideMenuColor,size: 25.0)),
                    itemDrawer(()async{
                      await FlutterShare.share(
                          title: 'رابط تطبيق المصريين',
                          linkUrl: 'https://play.google.com/store/apps/details?id=com.hyper.elmasreen',
                          chooserTitle: 'Choose ');
                    },DemoLocalizations.of(context).title['share_app'],
                        ImageIcon(AssetImage('assets/icons/share.png'),
                            color: iconSideMenuColor,size: 25.0))
                ],),decoration: BoxDecoration(color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 3,
                          blurRadius:3,
                          offset:
                          Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    border: Border.all(width: 1.0,color:Colors.grey.withOpacity(0.25))
                    ,borderRadius: BorderRadius.circular(8.0)),),
                SizedBox(height: 10.0,),
                Consumer<AccountProvider>(builder: (context,accountProvider,widget){
                  return FutureBuilder(future: accountProvider.loginOrNotFunction(),builder: (context,snapData){
                    String user = snapData.data;
                    return GestureDetector(onTap: (){
                      showLogoutDialog(context, (){ accountProvider.logOutFunction(context);});
                    },
                      child: user!=''?Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 3,
                              blurRadius:3,
                              offset:
                              Offset(0, 5), // changes position of shadow
                            ),
                          ],
                          border: Border.all(width: 1.0,color:Colors.grey.withOpacity(0.25))
                          ,borderRadius: BorderRadius.circular(8.0)),
                          padding: EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,children: [
                            ImageIcon(AssetImage('assets/icons/logout.png'),color: Colors.white,size: 25.0,),
                            SizedBox(width: 5.0,),
                            Expanded(child: Text(DemoLocalizations.of(context).title['logout'],
                              style: TextStyle(fontSize: 12.0,color: Colors.white),)),
                            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15.0,)
                          ],),
                      ):SizedBox(),
                    );
//                user!=''?Container(padding: EdgeInsets.all(5.0),
//                child: itemDrawer((){
//                  showLogoutDialog(context, (){ accountProvider.logOutFunction(context);});
//                 },DemoLocalizations.of(context).title['logout'],
//                    'assets/icons/logout.png'),decoration: BoxDecoration(color: Theme.of(context).primaryColor,
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.grey.withOpacity(0.25),
//                        spreadRadius: 3,
//                        blurRadius:3,
//                        offset:
//                        Offset(0, 5), // changes position of shadow
//                      ),
//                    ],
//                    border: Border.all(width: 1.0,color:Colors.grey.withOpacity(0.25))
//                    ,borderRadius: BorderRadius.circular(10.0)),):SizedBox();
                  });
                },),


        ],)


          ,),
      ),
    );
  }

  Widget itemDrawer(Function function,String title, Widget widget)
  {
    return GestureDetector(onTap: (){
      function();
    },
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,children: [
            widget,
        SizedBox(width: 5.0,),
        Expanded(child: Text(title,style: TextStyle(fontSize: 12.0,color: Colors.black.withOpacity(0.75)),)),
        Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15.0,)
      ],),
    );
  }

  Widget userNotLogIn()
  {
    return
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween
        ,children: [
          Container(alignment: Alignment.center,width: MediaQuery.of(context).size.width*0.3,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(width: 1.0,color: Colors.grey.withOpacity(0.25))
              , ),padding: EdgeInsets.all(5.0),
            child: GestureDetector(onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (BuildContext context)
              => LoginPageUI()));
            },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,children: [
//          Icon(Icons.person, color: Colors.white,size: 28.0,),
//          SizedBox(width: 5.0,),
                Text(DemoLocalizations.of(context).title['btn_login'],
                  style: TextStyle(color: Colors.white),)
              ],),
            ),
          ),
          GestureDetector(onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (BuildContext context)
            => SignUpUI()));
          },
              child:Container(alignment: Alignment.center,width: MediaQuery.of(context).size.width*0.3,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 1.0,color: Colors.grey.withOpacity(0.25))
                    , ),padding: EdgeInsets.all(5.0),child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,children: [
//        Icon(Icons.person_add,color: Colors.white,size: 28.0,),
//        SizedBox(width: 5.0,),
                    Text(DemoLocalizations.of(context).title['signUp'],
                      style: TextStyle(color: Colors.white),)
                  ],))
          )
        ],)

    ;
  }

  Widget userEntered(var title,var imageUrl,var phone)
  {
    //print('${title},,,,,,,${imageUrl},,,,,,,,,,sasa');
    return  GestureDetector(onTap: (){
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context)
      => MyAccountSideMenuUi()));
    },
      child: Container(width: MediaQuery.of(context).size.width *0.8,decoration: BoxDecoration(color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 3,
              blurRadius:3,
              offset:
              Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(width: 1.0,color: Colors.grey.withOpacity(0.25))
          ,borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.only(topRight:Radius.circular(5.0),
                bottomRight:Radius.circular(5.0) ),
              child:  FadeInImage.assetNetwork(
                  placeholder: 'assets/images/looding.gif',
                  fit: BoxFit.cover,width:60.0,height: 60.0,
                  image: imageUrl)
              //Image.asset('assets/images/imgcat.png',fit: BoxFit.fill,width:60.0,height: 60.0,)

              ,),
            SizedBox(width:6.0,),
            Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text(title,style: TextStyle(fontSize: 14.0,color: Colors.black.withOpacity(.75)),),
                Directionality(textDirection: TextDirection.ltr,child: Text(phone,style: TextStyle(fontSize: 12.0,color:Colors.black.withOpacity(.25)),))
              ],)
          ],),
      ),
    ) ;
  }
}
