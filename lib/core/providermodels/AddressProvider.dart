import 'dart:convert';

import 'package:elmasreenapp/Values.dart';
import 'package:elmasreenapp/core/models/AddressModel.dart';
import 'package:elmasreenapp/core/models/AreaModel.dart';
import 'package:elmasreenapp/core/models/RegionModel.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as httpRequest;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class AddressProvider extends ChangeNotifier {
  bool stateForm = true;
  bool errorPhone = false;
  bool userAddressState=false;
  AddressesUser addressesUserSelected;
  deleteErrorPhone() {
    errorPhone = false;
    notifyListeners();
  }

  putErrorPhone() {
    errorPhone = true;
    notifyListeners();
  }

  changeState(bool state) {
    stateForm = state;
    notifyListeners();
  }

  List<Area> areaItems = [];

  List<Region> regionItems = [];
   bool regionsState = false;
  bool areasState = false;

  List<AddressesUser> itemsAddressesUser = [];

  getCountryRegions() async {
    //   print('hellllllllllllllll');
    var body = {"country_id": '1'};
    try {
      final response = await httpRequest.post('${urlBase}/getCountryRegions',
          headers: headersMapWithOutToken, body: body);
     // print('${json.decode(response.body)['regions']},,sas');
      if (response.statusCode == 200 && response.body != null) {
        List data = json.decode(response.body)['regions'];
        regionItems = data.map((e) => Region.fromJson(e)).toList();
        regionsState = true;
        notifyListeners();
      }
    } catch (e) {
      print('${e},,,error regions');
    }
  }

  getCountryAreas(String regionID) async {
    //   print('hellllllllllllllll');
    var body = {"region_id": regionID.toString()};
      print('${body},,,,,area');

    try {
      final response = await httpRequest.post('${urlBase}/getRegionAreas',
          headers: headersMapWithOutToken, body: body);
       print('${json.decode(response.body)['regions']},,sas');
      if (response.statusCode == 200 && response.body != null) {
        List data = json.decode(response.body)['areas'];
        areaItems = data.map((e) => Area.fromJson(e)).toList();
        areasState = true;
        notifyListeners();
      }
    } catch (e) {
      print('${e},,,error areas');
    }
  }

//  changeStateAddress(AddressesUser addressesUser) {
//    selectedAddress = addressesUser;
//    notifyListeners();
//  }

  createAddressFunction(
      BuildContext context,
      var addressTitle,
      var address,
      var landMark,
      var phone1,
      var phone2,
      var regionId,
      var areaId,
      var lat,
      var lang) async {

    var bodyItems = {
      'address_title':addressTitle,
      'address': address,
      'land_mark': landMark,
      'phone1': phone1,
      'phone2': phone2,
      'country_id': '1',
      'region_id': regionId ,
      'area_id': areaId ,
      'lat': lat,
      'lng': lang,
      'is_primary':'0'
    };
   print('${bodyItems},,,,,,,aaaaaaaaa');
     try {
      final response = await httpRequest.post('${urlBase}/user/createAddress',
          headers: await headerWithToken(), body: bodyItems);
    //  print('${json.decode(response.body)},,,,,,,response');
      if (response.body != null &&
          response.statusCode == 200 &&
          json.decode(response.body)['statusCode'] == 201) {
      print('${json.decode(response.body)},,,,,,,response');
        Toast.show(DemoLocalizations.of(context).title['addaddressdone'], context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
         await getUserAddress();
        Navigator.of(context).pop();
      }
    } catch (e) {
      print('${e},,error add addresss');
    }
  }

  getUserAddress() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    itemsAddressesUser=[];
    userAddressState=false;
    notifyListeners();
    try {
      final response = await httpRequest.get('${urlBase}/user/getAddresses',
          headers: await headerWithToken());
     // print('${ json.decode(response.body)['addresses']},,,,,,sa');
      if (response.body != null &&
          response.statusCode == 200 &&
          json.decode(response.body)['statusCode'] == 404) {
        List dataUser = json.decode(response.body)['addresses'];
        itemsAddressesUser =
            dataUser.map((e) => AddressesUser.fromJson(e)).toList();
        userAddressState=true;
        for(int i=0;i<itemsAddressesUser.length;i++)
          {
            AddressesUser addressesUser=itemsAddressesUser[i];
            if(addressesUser.isPrimary=='1')
              {
                sh.setString('selectedId', addressesUser.id.toString());
                addressesUserSelected=addressesUser;
              }
          }
        notifyListeners();
      }
    } catch (e) {
      print('${e},,,get user addreess');
    }
  }

  makeAddressPrimary(BuildContext context,AddressesUser addressesUser)async
  {
    SharedPreferences sh = await SharedPreferences.getInstance();

    var body={
      'address_id':addressesUser.id.toString(),
      'is_primary':'1',
    };
    final response =await httpRequest.post('${urlBase}/user/makePrimaryAddress',body: body,
    headers:await headerWithToken());
    if(response.body!=null && response.statusCode==200 && json.decode(response.body)['statusCode']==200)
      {
//         Toast.show(DemoLocalizations.of(context).title['adddone'], context,
//            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      sh.setString('selectedId', addressesUser.id.toString());
      addressesUserSelected=addressesUser;
      await getUserAddress();
        }
  }

  deleteAddress(BuildContext context,AddressesUser addressesUser)async
  {
    SharedPreferences sh = await SharedPreferences.getInstance();
    var body={
      'address_id':addressesUser.id.toString(),
     };
    final response =await httpRequest.post('${urlBase}/user/deleteAddress',body: body,
        headers:await headerWithToken());
    if(response.body!=null && response.statusCode==200 && json.decode(response.body)['statusCode']==200)
    {
      if(addressesUser.isPrimary==1)
        {
          sh.remove('selectedId');
        }
      Toast.show(DemoLocalizations.of(context).title['deleteaddress'], context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      Navigator.of(context).pop();
      await getUserAddress();
    }
  }



 updateAddressFunction(
      BuildContext context,
  var addressTitle,var addressId,
      var address,
      var landMark,
      var phone1,
      var phone2,
      var regionId,
      var areaId,
      var lat,
      var lang,var primary) async {
    var bodyItems = {
      'address_title':addressTitle,

      'address_id':addressId.toString(),
      'address': address,
      'land_mark': landMark,
      'phone1': phone1,
      'phone2': phone2,
      'country_id': 1.toString(),
      'region_id': regionId.toString(),
      'area_id': areaId.toString(),
      'lat': lat.toString(),
      'lng': lang.toString(),
      'is_primary':primary.toString()
    };
   // print('${bodyItems},,,,,,,bodyItems');
    try {
      final response = await httpRequest.post('${urlBase}/user/updateAddress',
          headers: await headerWithToken(), body: bodyItems);
      if (response.body != null &&
          response.statusCode == 200
          ) {
       // print('${json.decode(response.body)},,,,,,,aaaaaaaaa');
            if(json.decode(response.body)['statusCode'] == 201)
              {
              await getUserAddress();
               Navigator.of(context).pop();
               Toast.show(DemoLocalizations.of(context).title['Modifiedsuccessfully'], context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

              }

      }
    }
    catch (e) {
      print('${e},,error update addresss');
    }
  }
}
