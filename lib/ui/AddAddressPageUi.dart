import 'dart:async';
import 'package:elmasreenapp/core/models/AreaModel.dart';
import 'package:elmasreenapp/core/models/RegionModel.dart';
import 'package:elmasreenapp/core/providermodels/AddressProvider.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'componentui/ButtonUi.dart';
import 'componentui/KeyPhoneUi.dart';
import 'componentui/TextFieldFormUi.dart';
import 'layout/CommonAppBarUi.dart';
class AddAddressPageUi extends StatefulWidget {
  @override
  _AddAddressPageUiState createState() => _AddAddressPageUiState();
}

class _AddAddressPageUiState extends State<AddAddressPageUi> {
  final textAddressTitle = TextEditingController();
  final addressFocus = FocusNode();

  final textCity = TextEditingController();
  final textRegion = TextEditingController();
  final textStreet = TextEditingController();
  final textPhone = TextEditingController();
  final textPhone2 = TextEditingController();
  final landMarkFocus = FocusNode();
  final phoneFocus = FocusNode();
  final phone2Focus = FocusNode();

  final formKeyAddAddress = GlobalKey<FormState>();
  Region selectedRegion;
  Area selectedArea;
  Set<Marker> markers = Set();
  AddressProvider addressProvider;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
        ),
      );

      _initialcameraposition=LatLng(l.latitude, l.longitude);
      print('${LatLng(_initialcameraposition.latitude, _initialcameraposition.longitude)},,,,xxxxxxxxxxxxx');
      markers.add(Marker(markerId: MarkerId('موقعك الحالي'),icon: BitmapDescriptor.fromAsset('assets/images/pin.png'),
          visible: true,position:LatLng(
              double.parse(l.latitude.toString()), double.parse(l.longitude.toString())) ));
    });
  }


  init() async {
    await Future.delayed(Duration(milliseconds: 100));
    addressProvider = Provider.of<AddressProvider>(context, listen: false);

    addressProvider.changeState(true);
    addressProvider.deleteErrorPhone();
    addressProvider.getCountryRegions();

   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();

  }

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: commonAppBarUi(
              DemoLocalizations.of(context).title['addaddress'], context),
          preferredSize: Size.fromHeight(50.0),
        ),
        body: Consumer<AddressProvider>(
          builder: (context, addressProvider, widgetUi) {
            return Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 50.0,
                            padding: EdgeInsets.only(left: 3.0, right: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: addressProvider.regionsState
                                ? DropdownButton<Region>(
                                    elevation: 0,
                                    iconSize: 20.0,
                                    isExpanded: true,
                                    hint: Text(
                                      selectedRegion == null
                                          ? DemoLocalizations.of(context)
                                              .title['region']
                                          : selectedRegion.name.toString(),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black87),
                                    ),
                                    underline: Container(),
                                    items: addressProvider.regionItems
                                        .map((Region value) {
                                      return DropdownMenuItem<Region>(
                                        value: value,
                                        child: Text(
                                          value.name.toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRegion = value;
                                      });
                                      addressProvider.getCountryAreas(value.id.toString());
                                    },
                                  )
                                : CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                height: 50.0,
                                padding:
                                    EdgeInsets.only(left: 3.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: selectedRegion != null
                                    ? addressProvider.areasState
                                        ? DropdownButton<Area>(
                                            elevation: 0,
                                            iconSize: 20.0,
                                            isExpanded: true,
                                            hint: Text(
                                              selectedArea != null
                                                  ? selectedArea.name.toString()
                                                  : DemoLocalizations.of(
                                                          context)
                                                      .title['city'],
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.black87),
                                            ),
                                            underline: Container(),
                                            items: addressProvider.areaItems
                                                .map((Area value) {
                                              return DropdownMenuItem<Area>(
                                                value: value,
                                                child: Text(
                                                  value.name.toString(),
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedArea = value;
                                              });
                                            },
                                          )
                                        : CircularProgressIndicator()
                                    : Text(
                                        DemoLocalizations.of(context)
                                            .title['city'],
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black87),
                                      ))),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Form(
                        key: formKeyAddAddress,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFieldFormUi(
                              fontSizeError: 12.0,
                              contentPaddingTop: 0.0,
                              suffixIcon: null,
                              min: 1,
                              max: 1,
                              contentPadding: 10.0,
                              errorTitle: DemoLocalizations.of(context)
                                  .title['addresstitlerequired'],
                              hintValue: DemoLocalizations.of(context)
                                  .title['addresstitle'],
                              isSecure: false,
                              textInputType: TextInputType.text,
                              prefixIcon: null,
                              textEditingController: textAddressTitle,
                              ownFocusNode: null,
                              focusNode: addressFocus,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFieldFormUi(
                              fontSizeError: 12.0,
                              contentPaddingTop: 0.0,
                              suffixIcon: null,
                              min: 1,
                              max: 1,
                              contentPadding: 10.0,
                              errorTitle: DemoLocalizations.of(context)
                                  .title['streetrequired'],
                              hintValue:
                                  DemoLocalizations.of(context).title['street'],
                              isSecure: false,
                              textInputType: TextInputType.text,
                              prefixIcon: null,
                              textEditingController: textStreet,
                              ownFocusNode: addressFocus,
                              focusNode: landMarkFocus,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFieldFormUi(
                              fontSizeError: 12.0,
                              contentPaddingTop: 0.0,
                              suffixIcon: null,
                              min: 1,
                              max: 1,
                              contentPadding: 10.0,
                              errorTitle: DemoLocalizations.of(context)
                                  .title['landmarkrequired'],
                              hintValue: DemoLocalizations.of(context)
                                  .title['landmark'],
                              isSecure: false,
                              textInputType: TextInputType.text,
                              prefixIcon: null,
                              textEditingController: textCity,
                              ownFocusNode: landMarkFocus,
                              focusNode: phoneFocus,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Expanded(
                                      child: TextFieldFormUi(
                                    contentPaddingTop: 0.0,
                                    suffixIcon: null,
                                    min: 1,
                                    max: 1,
                                    contentPadding: 10.0,
                                    errorTitle: '',
                                    hintValue: '0123456789',
                                    fontSizeError: 0.0,
                                    isSecure: false,
                                    textInputType: TextInputType.phone,
                                    prefixIcon: null,
                                    textEditingController: textPhone,
                                    ownFocusNode: phoneFocus,
                                    focusNode: phone2Focus,
                                  )),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                KeyPhoneUi(),
                              ],
                            ),
                            Visibility(
                              visible: addressProvider.errorPhone,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                      DemoLocalizations.of(context)
                                          .title['phonerequired'],
                                      style: TextStyle(
                                          height: 1.0,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.red,
                                          fontSize: 12.0)),
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Expanded(
                              child: TextFieldFormUi(
                            contentPaddingTop: 0.0,
                            suffixIcon: null,
                            min: 1,
                            max: 1,
                            contentPadding: 10.0,
                            errorTitle: '',
                            hintValue: '0123456789',
                            fontSizeError: 0.0,
                            isSecure: false,
                            textInputType: TextInputType.phone,
                            prefixIcon: null,
                            textEditingController: textPhone2,
                            ownFocusNode: phone2Focus,
                            focusNode: FocusNode(),
                          )),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        KeyPhoneUi(),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 48.0,
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white),
                          child: Icon(
                            Icons.gps_fixed,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: Container(
                          height: 48.0,
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white),
                          child: Text(DemoLocalizations.of(context)
                              .title['locationonmap']),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150.0,
                        child:GoogleMap(
                          initialCameraPosition: CameraPosition(target: _initialcameraposition),
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          myLocationEnabled: false,markers: markers,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ButtonUi(
                      widget: Text(
                        DemoLocalizations.of(context).title['confirm'],
                        style: TextStyle(color: Colors.white),
                      ),
                      backColor: Theme.of(context).accentColor,
                      function: () {
                        if (!formKeyAddAddress.currentState.validate()) {
                          addressProvider.changeState(false);
                          addressProvider.putErrorPhone();
                          return;
                        }
                        formKeyAddAddress.currentState.save();
                        addressProvider.deleteErrorPhone();
                        addressProvider.changeState(true);
                        if (selectedRegion != null && selectedArea != null) {
                          addressProvider.createAddressFunction(
                              context,
                              textAddressTitle.text.toString(),
                              textStreet.text.toString(),
                              textCity.text.toString(),
                              textPhone.text.toString(),
                              textPhone2.text.toString(),
                              selectedRegion.id.toString(),
                              selectedArea.id.toString(),
                              _initialcameraposition.latitude.toString(),
                              _initialcameraposition.longitude.toString());
                        } else {
                          Toast.show('أختر المنطقة و المدينة أولاً', context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      doubleValue: MediaQuery.of(context).size.width * 0.9,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
