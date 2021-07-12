import 'dart:async';
import 'dart:ui';
import 'package:elmasreenapp/core/models/AddressModel.dart';
import 'package:elmasreenapp/core/models/AreaModel.dart';
import 'package:elmasreenapp/core/models/RegionModel.dart';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/core/providermodels/AddressProvider.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
 import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'componentui/ButtonUi.dart';
import 'componentui/KeyPhoneUi.dart';
import 'componentui/TextFieldFormUi.dart';
import 'layout/CommonAppBarUi.dart';
class AddressDetailsUi extends StatefulWidget {
  final AddressesUser addressesUser;

  const AddressDetailsUi({Key key, this.addressesUser}) : super(key: key);


  @override
  _AddressDetailsUiState createState() => _AddressDetailsUiState();
}

class _AddressDetailsUiState extends State<AddressDetailsUi> {
  final textAddressTitle=TextEditingController();
  final addressFocus=FocusNode();
  final textCity=TextEditingController();
  final textRegion=TextEditingController();
  final textStreet=TextEditingController();
  final textPhone=TextEditingController();

  final textPhone2=TextEditingController();

  final landMarkFocus=FocusNode();
  final phoneFocus=FocusNode();
  final phone2Focus=FocusNode();

  final formKeyAddAddress = GlobalKey<FormState>();
  Region selectedRegion;
  Area selectedArea;
  AddressProvider addressProvider;

  init()async
  {
    await Future.delayed(Duration(milliseconds: 100));
    addressProvider=Provider.of<AddressProvider>(context,listen:false);
    addressProvider.changeState(true);
    addressProvider.deleteErrorPhone();
    addressProvider.getCountryRegions();
    addressProvider.getCountryAreas(widget.addressesUser.regionId.toString());
  }

  Set<Marker> markers = Set();
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    textPhone.text=widget.addressesUser.phone1.toString();
    textPhone2.text=widget.addressesUser.phone2.toString();
    textStreet.text=widget.addressesUser.address.toString();
    textCity.text=widget.addressesUser.landMark.toString();
    textAddressTitle.text=widget.addressesUser.addressTitle.toString();
    markers.add(Marker(markerId: MarkerId('موقعك الحالي'),icon: BitmapDescriptor.fromAsset('assets/images/pin.png'),
        visible: true,position:LatLng(
            double.parse(widget.addressesUser.lng), double.parse(widget.addressesUser.lat)) ));


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: PreferredSize(
      child: commonAppBarUi('اسم العنوان' ,
          context
      ),preferredSize: Size.fromHeight(50.0),
    ),
      body: Consumer<AddressProvider>(builder: (context,addressProvider,widgetUi){return Container(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: SingleChildScrollView(child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1,
                child: Container( height: 50.0,padding: EdgeInsets.only(left: 3.0,right: 10.0),
                  alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,
                      border: Border.all(color:Colors.grey.withOpacity(0.5),width: 1.0)
                      ,borderRadius: BorderRadius.circular(8.0)),
                  child: DropdownButton<Region>(
                    elevation: 0,
                    iconSize:20.0,
                    isExpanded: true,
                    hint:   Text(selectedRegion==null?widget.addressesUser.region:selectedRegion.name.toString()
                      ,style: TextStyle(
                          fontSize: 12.0,color: Colors.black87),
                    ),
                    underline: Container(),
                    items:addressProvider.regionItems.map((Region value) {
                      return DropdownMenuItem<Region>(
                        value: value,
                        child: Text(value.name.toString(),style: TextStyle(fontSize:12.0,
                        ),),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRegion=value;
                      });
                      addressProvider.getCountryAreas(value.id.toString());
                    },
                  ),),
              ),
              SizedBox(width: 10.0,),
              Expanded(flex: 1,
                child: Container( height: 50.0,padding: EdgeInsets.only(left: 3.0,right: 10.0),
                  alignment: Alignment.center,decoration: BoxDecoration(color:Colors.white,
                      border: Border.all(color:Colors.grey.withOpacity(0.5),width: 1.0)
                      ,borderRadius: BorderRadius.circular(8.0)),
                  child: DropdownButton<Area>(
                    elevation: 0,
                    iconSize:20.0,
                    isExpanded: true,
                    hint:   Text( selectedArea==null?
                    widget.addressesUser.area:selectedArea.name.toString()
                      ,style: TextStyle(
                          fontSize: 12.0,color: Colors.black87),
                    ),
                    underline: Container(),
                    items:addressProvider.areaItems.map((Area value) {
                      return DropdownMenuItem<Area>(
                        value: value,
                        child: Text(value.name.toString(),style: TextStyle(fontSize:12.0,
                        ),),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedArea=value;
                      });
                    },
                  ),),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Form(key: formKeyAddAddress,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,children: [
            TextFieldFormUi(fontSizeError: 12.0,
              contentPaddingTop: 0.0,suffixIcon: null,min: 1,max: 1,contentPadding:10.0,
              errorTitle: DemoLocalizations.of(context).title['addresstitlerequired'],
              hintValue:DemoLocalizations.of(context).title['addresstitle'] ,
              isSecure: false,textInputType: TextInputType.text,
              prefixIcon:null
              ,textEditingController: textAddressTitle,
              ownFocusNode: null,focusNode:addressFocus ,),
            SizedBox(height: 10.0,),
            TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,suffixIcon: null,min: 1,max: 1,contentPadding:10.0,
              errorTitle: DemoLocalizations.of(context).title['streetrequired'],
              hintValue:DemoLocalizations.of(context).title['street'] ,
              isSecure: false,textInputType: TextInputType.text,
              prefixIcon:null
              ,textEditingController: textStreet,
              ownFocusNode: null,focusNode: landMarkFocus,),
            SizedBox(height: 10.0,),
            TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,suffixIcon: null,min: 1,max: 1,contentPadding:10.0,
              errorTitle: DemoLocalizations.of(context).title['landmarkrequired'],
              hintValue:DemoLocalizations.of(context).title['landmark'] ,
              isSecure: false,textInputType: TextInputType.text,
              prefixIcon:null
              ,textEditingController: textCity,
              ownFocusNode: landMarkFocus,focusNode: phoneFocus,),
            SizedBox(height: 10.0,),
//              TextFieldFormUi(contentPaddingTop: 0.0,suffixIcon: null,min: 1,max: 1,contentPadding: 10.0,
//                errorTitle: DemoLocalizations.of(context).title['regionrequired'],
//                hintValue:DemoLocalizations.of(context).title['region'] ,
//                isSecure: false,textInputType: TextInputType.text,
//                prefixIcon:null
//                ,textEditingController: textRegion,
//                ownFocusNode: regionFocus,focusNode: streetFocus,),
//              SizedBox(height: 10.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,children: [
              Directionality(textDirection: TextDirection.ltr,
                child: Expanded(child: TextFieldFormUi(contentPaddingTop: 0.0,suffixIcon: null,min: 1,max: 1
                  ,contentPadding: 10.0,fontSizeError: 0.0,
                  errorTitle:null,
                  hintValue:'123456789' ,
                  isSecure: false,textInputType: TextInputType.phone,
                  prefixIcon:null
                  ,textEditingController: textPhone,
                  ownFocusNode:  phoneFocus,focusNode:phone2Focus ,)),
              ),
              SizedBox(width: 10.0,),
              KeyPhoneUi(),


            ],),
            Visibility(visible: addressProvider.errorPhone,
              child: Column(
                children: [
                  SizedBox(
                    height:8.0,
                  ),
                  Text( DemoLocalizations.of(context)
                      .title['phonerequired'],style:TextStyle(height: 1.0, fontWeight: FontWeight.w300,color: Colors.red,
                      fontSize: 12.0)),
                ],
              ),
            ),

          ],)),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,children: [
            Directionality(textDirection: TextDirection.ltr,
              child: Expanded(child: TextFieldFormUi(contentPaddingTop: 0.0,suffixIcon: null,min: 1,max: 1
                ,contentPadding: 10.0,
                errorTitle:'',fontSizeError: 0.0,
                hintValue:'123456789' ,
                isSecure: false,textInputType: TextInputType.phone,
                prefixIcon:null
                ,textEditingController: textPhone2,
                ownFocusNode:  phone2Focus,focusNode:FocusNode() ,)),
            ),
            SizedBox(width: 10.0,),
            KeyPhoneUi(),


          ],),

          SizedBox(height: 10.0,),
          Row(children: [
            Container( height:48.0,padding: EdgeInsets.only(left: 10.0,right:10.0),
              alignment: Alignment.center,decoration: BoxDecoration(
                  border: Border.all(color:Colors.grey.withOpacity(0.5),width: 1.0)
                  ,borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              child:                  Icon(Icons.gps_fixed,color: Colors.red,),
            ),
            SizedBox(width: 10.0,),
            Expanded(child: Container( height:48.0,padding: EdgeInsets.only(left: 5.0,right:5.0),
              alignment: Alignment.centerRight,decoration: BoxDecoration(
                  border: Border.all(color:Colors.grey.withOpacity(0.5),width: 1.0)
                  ,borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              child:Text(DemoLocalizations.of(context).title['locationonmap']),
            ))
          ],),
          SizedBox(height: 10.0,),
          ClipRRect(borderRadius: BorderRadius.circular(8.0),child:
          Container(width: MediaQuery.of(context).size.width,
            height: 150.0,child: GoogleMap(
              onMapCreated: (controller) async {
                _controller.complete(controller);
              },
              mapType: MapType.normal,
              markers: markers,
              initialCameraPosition: CameraPosition(
                  target: LatLng(double.parse(widget.addressesUser.lat.toString()),
                      double.parse(widget.addressesUser.lng.toString())), zoom: 15),
            ),
          ),),
          SizedBox(height: 30.0,),

          Consumer<AccountProvider>(builder: (context,accountProvider,widgetUi){return  ButtonUi(widget: Text(DemoLocalizations.of(context).title['edit'],style: TextStyle(color: Colors.white),),
            backColor: Theme.of(context).accentColor,
            function: (){
              if(!formKeyAddAddress.currentState.validate())
              {
                addressProvider.changeState(false);
                addressProvider.putErrorPhone();
                return;

              }
              formKeyAddAddress.currentState.save();
              addressProvider.deleteErrorPhone();

              addressProvider.changeState(true);
               addressProvider.updateAddressFunction(context,textAddressTitle.text.toString(),widget.addressesUser.id,textStreet.text.toString(), textCity.text.toString()
                  , textPhone.text.toString(), textPhone2.text.toString(),
                  selectedRegion==null?widget.addressesUser.regionId:selectedRegion.id,
                  selectedArea==null?widget.addressesUser.areaId:selectedArea.id, 30.0623765, 31.2672291,
              widget.addressesUser.isPrimary);

            },
            doubleValue: MediaQuery.of(context).size.width*0.9,);}),
          SizedBox(height: 20.0,),

        ],),),);}),
    ));
  }
}
