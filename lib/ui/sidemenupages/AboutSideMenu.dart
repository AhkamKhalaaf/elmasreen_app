import 'dart:async';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:html/parser.dart' show parse;
import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSideMenu extends StatefulWidget {
  @override
  _AboutSideMenuState createState() => _AboutSideMenuState();
}

class _AboutSideMenuState extends State<AboutSideMenu> {
  Set<Marker> markers = Set();
  Completer<GoogleMapController> _controller = Completer();

openUrlApp(var url)async
{
  if (await canLaunch(url)) {
await launch(url);
} else {
Toast.show(
DemoLocalizations.of(context).title['notavailablenow'],
context,
duration: Toast.LENGTH_LONG,
gravity: Toast.BOTTOM);
}
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(child: commonAppBarUi(
          DemoLocalizations.of(context).title['aboutApp'],
          context
        ),
            preferredSize: Size.fromHeight(50.0),),
        body:Consumer<CartProvider>(builder: (context,acc,widgetUi){
          markers.add(Marker(
              markerId: MarkerId('المصريين'),
              icon: BitmapDescriptor.defaultMarker,
              visible: true,
              position:LatLng(double.parse(acc.mapAboutApp.lat.toString()),
                  double.parse(acc.mapAboutApp.lng.toString()))));
          return Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/fulllogo.png',width: MediaQuery.of(context).size.width * 0.5,

                    height:  MediaQuery.of(context).size.width * 0.35,),
                  SizedBox(height: 10.0,),
                  Divider(color: Colors.grey.withOpacity(0.5),thickness: 1.0,),
                  SizedBox(height: 10.0,),
                  ClipRRect(borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140.0,
                        child: GoogleMap(
                          onMapCreated: (controller) async {
                            _controller.complete(controller);
                          },
                          mapType: MapType.normal,
                          markers: markers,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(double.parse(acc.mapAboutApp.lat),double.parse(acc.mapAboutApp.lng)),
                              zoom: 12),
                        )),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(color: Colors.grey.withOpacity(0.5),thickness: 1.0,),
                  SizedBox(
                    height:5.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on,color:Theme.of(context).primaryColor ,),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          acc.mapAboutApp.address1,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//                    ImageIcon(
//                      AssetImage('assets/icons/email.png'),
//                      color: Theme.of(context).primaryColor,
//                    ),
                      Icon(Icons.email,color:Theme.of(context).primaryColor ,),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          acc.mapAboutApp.email,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.phone,color:Theme.of(context).primaryColor ,),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          acc.mapAboutApp.telphone,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height:5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
//                      GestureDetector(onTap: (){
//
//                      },
//                        child: ImageIcon(
//                          AssetImage('assets/icons/what.png'),
//                          size: 35.0,
//                        ),
//                      ),
                      GestureDetector(onTap: (){
                        openUrlApp(acc.mapAboutApp.twitter);
                      },
                        child: ImageIcon(
                          AssetImage('assets/icons/twitter.png'),
                          size: 35.0,
                        ),
                      ),
                      GestureDetector(onTap: (){
                        openUrlApp(acc.mapAboutApp.sanpchat);
                      },
                        child: ImageIcon(
                          AssetImage('assets/icons/tele.png'),
                          size: 35.0,
                        ),
                      ),
                      GestureDetector(onTap: (){
                        openUrlApp(acc.mapAboutApp.instgram);

                      },
                        child: ImageIcon(
                          AssetImage('assets/icons/insta.png'),
                          size: 35.0,
                        ),
                      ),
                      GestureDetector(onTap: (){
                        openUrlApp(acc.mapAboutApp.facebook);

                      },
                        child: ImageIcon(
                          AssetImage('assets/icons/facebook.png'),
                          size: 35.0,
                        ),
                      )
                    ],
                  ),
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
                  Text(
                      parse(parse(acc.mapAboutApp.aboutApp.toString()).body.text).
                      documentElement.text.toString()

                    ,
                    style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          );
        },)
      ),
    );
  }
}
