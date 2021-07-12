import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:elmasreenapp/core/models/AboutAppModel.dart';
import 'package:elmasreenapp/core/models/IntroSliderrModel.dart';
import 'package:elmasreenapp/core/models/SideMenuPagesModel.dart';
import 'package:elmasreenapp/core/models/notificationsModel.dart';
import 'package:elmasreenapp/ui/HomePageUI.dart';
import 'package:elmasreenapp/ui/NewPasswordUI.dart';
import 'package:elmasreenapp/ui/SplashUi.dart';
import 'package:elmasreenapp/ui/VerificationUi.dart';
import 'package:elmasreenapp/ui/layout/BackGroundLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as httpRequest;
import '../../Values.dart';

class AccountProvider extends ChangeNotifier
{
String nameUser='';
String phoneUser='';
String emailUser='';
String imageUser='';
String idUser='';
 bool stateForm=true;
 bool errorPhone=false;
 List<OneSideMenuPage>pagesList=[];
  putErrorPhone()
 {
  errorPhone= true;
  notifyListeners();
 }
 deleteErrorPhone()
 {
  errorPhone=false;
  notifyListeners();
 }
 changeState(bool state)
 {
  stateForm=state;
  notifyListeners();
 }
 loginFunction(BuildContext context,var emailPhone,var passWord)async
 {
   SharedPreferences sh=await SharedPreferences.getInstance();

   var map ={
     'email':emailPhone,
     'password':passWord,
     'device_type':Platform.isAndroid?'android':'ios',
     'token':sh.getString('tokennotification'),
     //'token':'fdfdf'

   };
   //print('${map},,,,,,,,,,,,body');

   try{

   final response = await httpRequest.post('${urlBase}/login',body: map,headers: headersMapWithOutToken) ;
 //print('${json.decode(response.body)},,,,,,,,,,,,body');
   if(response.body!=null && response.statusCode==200)
    {
  //  print('${json.decode(response.body)},,,,,,,,,,,,body');
    var dataApi = json.decode(response.body);
      if(dataApi['statusCode']==200)
       {
        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        sharedPreferences.setString('token', dataApi['token']);
        sharedPreferences.setString('user_id', dataApi['userData']['user_id'].toString());
        sharedPreferences.setString('name', dataApi['userData']['name']);
        sharedPreferences.setString('email', dataApi['userData']['email']);
        sharedPreferences.setString('phone', dataApi['userData']['phone']);
        sharedPreferences.setString('image', dataApi['userData']['image']);

        Toast.show(
            DemoLocalizations.of(context).title['loginsms'],
            context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            HomePageUI()), (Route<dynamic> route) => false);
       }
      else
       {
        Toast.show(
            dataApi['message'],
            context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM);
       }
    }

  }
  catch(exception){
   print('${exception},,,,error login');
  }



 }
accountVerficationFunction(BuildContext context,var emailPhone,var code,var type)async
{
  var map ={
    'phone':emailPhone,
    'code':code,


  };
  try{
     print('${map},,,,,,,booooooody');
    final response = await httpRequest.post('${urlBase}/accountVerfication',
        body: map,headers: headersMapWithOutToken) ;
   // print('${json.decode(response.body)},,,,,,,fdf');
    if(response.body!=null && response.statusCode==200)
    {
      var dataApi = json.decode(response.body);
      if(dataApi['statusCode']==200)
      {

       if(type=='pass')
         {
//           Toast.show(
//               DemoLocalizations.of(context).title['accountiscreated'],
//               context,
//               duration: Toast.LENGTH_LONG,
//               gravity: Toast.BOTTOM);
           Navigator.pushReplacement(
               context, MaterialPageRoute(builder: (BuildContext context) => NewPasswordUI(
             visibleValue: false,userPhone:emailPhone,
           )));
         }
       else
         {
           SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
           sharedPreferences.setString('token', dataApi['token']);
           sharedPreferences.setString('user_id', dataApi['userData']['user_id'].toString());
           sharedPreferences.setString('name', dataApi['userData']['name']);
           sharedPreferences.setString('email', dataApi['userData']['email']);
           sharedPreferences.setString('phone', dataApi['userData']['phone']);
           sharedPreferences.setString('image', dataApi['userData']['image']);
           Toast.show(
               DemoLocalizations.of(context).title['accountiscreated'],
               context,
               duration: Toast.LENGTH_LONG,
               gravity: Toast.BOTTOM);
           showSuccessFunction(context,'assets/images/check.png','');
           Timer(Duration(seconds: 3), ()=>{
             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                 HomePageUI()), (Route<dynamic> route) => false)
           });
         }


      }
      else
      {
        Toast.show(
            dataApi['message'],
            context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM);
      }
    }

  }
  catch(exception){
    print('${exception},,,,error verification');
  }



}
 signUpFunction(BuildContext context,var name,var phone,var email,var password,var passwordConfirm)async
 {
   //tokennotification
   SharedPreferences sh=await SharedPreferences.getInstance();
  var map ={
     'name':name,
     'email':email,
     'phone':phone,
     'password':password,
    'password_confirmation':passwordConfirm,
     'country_id':'1',
     'device_type':Platform.isAndroid?'android':'ios',
     'token':sh.getString('tokennotification'),
    'status':'0'
   };
  print('${map},,,,,,,,,,,,body');
   if(password.toString()!=passwordConfirm.toString())
     {
       Toast.show(
           DemoLocalizations.of(context).title['notmatchd'],
           context,
           duration: Toast.LENGTH_LONG,
           gravity: Toast.BOTTOM);
     }
   else
     {
       try{
         final response = await httpRequest.post('${urlBase}/register',body:map,
         headers: headersMapWithOutToken) ;
      print('${json.decode(utf8.decode(response.bodyBytes))},,,,,sasa');
         if(response.body!=null && response.statusCode==200)
         {
           var dataApi = json.decode(response.body);
           if(dataApi['statusCode']==201)
           {

             Toast.show(
                 dataApi['message'],
                 context,
                 duration: Toast.LENGTH_LONG,
                 gravity: Toast.BOTTOM);
             Navigator.push(
                 context, MaterialPageRoute(builder: (BuildContext context) =>
                 VerificationUi(typeVerification: 'register',
                 phone: phone)));
           }
           else
           {
             Toast.show(
                 dataApi['message'],
                 context,
                 duration: Toast.LENGTH_LONG,
                 gravity: Toast.BOTTOM);
           }
         }

       }
       catch(exception){
         print('${exception},,,,error sign up');
       }
     }




 }
 logOutFunction(BuildContext context)async
 {
 // print('hjhj');
  Navigator.of(context).pop();
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.remove('user_id');
  sharedPreferences.remove('name');
  sharedPreferences.remove('email');
  sharedPreferences.remove('phone');
  sharedPreferences.remove('image');
  sharedPreferences.remove('token');
  sharedPreferences.remove('selectedId');

  //tokennotification
  Toast.show(
      DemoLocalizations.of(context).title['logedoutsucces'],
      context,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM);

  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      SplashUi(backWidget: BackGroundLayout(pathImage: 'assets/images/backsplashimage.png',),
       logoPath: 'assets/images/fulllogo.png',
      ),), (Route<dynamic> route) => false);

 }
 Future<String>loginOrNotFunction()async
 {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  if(sharedPreferences.containsKey('user_id') && sharedPreferences.getString('user_id')!='')
    {

        nameUser=sharedPreferences.getString('name');
       phoneUser=sharedPreferences.getString('phone');
       imageUser=sharedPreferences.getString('image');
       idUser=sharedPreferences.getString('user_id');
       emailUser=sharedPreferences.getString('email');
       notifyListeners();
     }
 return sharedPreferences.containsKey('user_id')?sharedPreferences.getString('user_id'):'';

 }


resetPasswordVerficationFunction(BuildContext context,var phone)async
{
  try{
    var body ={'phone':phone};
    //print('${body},,,,,,,,,,,,body');
    final response = await httpRequest.post('${urlBase}/resetPasswordVerfication'
        ,body: body,headers: headersMapWithOutToken);
   print('${json.decode(response.body)},,,,,,,,,,,,respone');

    if(response.body!=null&& response.statusCode==200)
      {
        if(json.decode(response.body)['statusCode']==200)
          {
            Toast.show(
                json.decode(response.body)['message'],
                context,
                duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM);
            Navigator.push(
                context, MaterialPageRoute(builder: (BuildContext context) =>
                VerificationUi(typeVerification: 'pass',
                    phone: phone)));
          }
        else
          {
            Toast.show(
                json.decode(response.body)['message'],
                context,
                duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM);
          }
      }
  }
  catch(e)
  {
    print('${e},,,,,,,,,,,,resetPasswordVerfication');
  }
}
//checkResetPasswordVerfication

  resetPasswordFunction(BuildContext context,var phone,var password,var confirmPassword)async
  {
    print('reset password');
    try{
      var body ={'phone':phone,
      'password':password,
      'confirm_password':confirmPassword};
      print('${body},,,,,,,,reset password');

      final response = await httpRequest.post('${urlBase}/resetPassword',body: body
          ,headers: headersMapWithOutToken);

      print('${json.decode(response.body)},,,,,,,,reset password');
      if(response.body!=null&& response.statusCode==200)
      {
        if(json.decode(response.body)['statusCode']==200)
        {
          Toast.show(
              json.decode(response.body)['message'],
              context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
          Navigator.push(
              context, MaterialPageRoute(builder: (BuildContext context) =>
              HomePageUI( )));
        }
        else
        {
          Toast.show(
              json.decode(response.body)['message'],
              context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
        }
      }
    }
    catch(e)
    {
      print('${e},,,,,,,,,,,,resetPassword');
    }
  }

  changePasswordFunction(BuildContext context,var oldPassword,var password,var confirmPassword)async
  {
    try{
      var body ={'old_password':oldPassword,
        'password':password,
        'confirm_password':confirmPassword};
      final response = await httpRequest.post('${urlBase}/changePassword',body: body,
          headers: await headerWithToken());
     // print('${await headerWithToken()},,,,,,,,,,,,header');
      //print('${json.decode(response.body)},,,,,,,,,,,,chnnnnnpasswrdod');
      if(response.body!=null&& response.statusCode==200)
      {

        if(json.decode(response.body)['statusCode']==200)
        {
          Toast.show(
              json.decode(response.body)['message'],
              context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
          Navigator.of(context).pop();

        }
        else
        {
          Toast.show(
              json.decode(response.body)['message'],
              context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
        }
      }
    }
    catch(e)
    {
      print('${e},,,,,,,,,,,,resetPassword');
    }
  }
  updateProfileFunction(BuildContext context,var name,var email,File filePath)async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try{
      String fileName =  basename(filePath.path);
      var uri = Uri.parse('${urlBase}/user/updateProfile');
      var request = httpRequest.MultipartRequest('POST',uri)..headers['lang']='ar'
        ..headers['Authorization']='Bearer '+sharedPreferences.getString('token')
      ..fields['name']=name
      ..fields['email']=email
      ..fields['country_id']='1'
      ..files.add(await httpRequest.MultipartFile.fromPath('image', filePath.path,
          contentType: MediaType('image',  fileName.split('.').last)));
      print('${request.fields},,,fileds');
      print('${request.headers},,,headers');
      var response = await request.send();

      var respStr = await response.stream.bytesToString();
      print('${json.decode(respStr)},,,ressss');
      if(json.decode(respStr)['statusCode']==200)
        {

          Toast.show(
              json.decode(respStr)['message'],
              context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
          SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
          sharedPreferences.setString('token', json.decode(respStr)['token']);
          sharedPreferences.setString('user_id', json.decode(respStr)['userData']['user_id'].toString());
          sharedPreferences.setString('name', json.decode(respStr)['userData']['name']);
          sharedPreferences.setString('email', json.decode(respStr)['userData']['email']);
          sharedPreferences.setString('phone', json.decode(respStr)['userData']['phone']);
          sharedPreferences.setString('image', json.decode(respStr)['userData']['image']);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      else
        {
          Toast.show(
              json.decode(respStr)['message'],
              context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
        }


    }
    catch(e)
    {
      print('${e},,,,,,,,,,,,update profile');
    }
  }
  
  refreshToken()async
  {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if(sh.getString('email')!=null)
      {
        var body={
          'email':sh.getString('email')
        };
        try{
          var response = await httpRequest.post('${urlBase}/refreshToken',body: body);
          if(response.body!=null&&response.statusCode==200)
          {
            var data = json.decode(response.body);
           // print('${json.decode(response.body)},,,,refrsh datata');
            sh.setString('token', data['token']);
          }
        }
        catch(e)
    {
      print('${e},,,,refrsh token');
    }
      }

  }
  
  getSideMenuPages()async
  {
    try{
      final response = await httpRequest.get('${urlBase}/pages',headers: headersMapWithOutToken);
      if(response.body!=null && response.body!=null && json.decode(response.body)['statusCode']==200)
        {
           List data=json.decode(response.body)['pages'];
          pagesList=data.map((e) => OneSideMenuPage.fromJson(e)).toList();
          notifyListeners();
        }
    }
    catch(e)
    {
      print('${e},,,,sidemenu pages error');
    }
  }
  


  Future<List<OneSlider>>getSliderItems(String queryStringUrl)async
  {
    //
    try{
      final response =await httpRequest.get('${urlBase}/$queryStringUrl',headers: headersMapWithOutToken);

      if(response.body!=null && response.statusCode==200)
        {

          List items = json.decode(response.body)['sliders'];
        //  print('${json.decode(response.body)['sliders']},,,,,,sasa');
          return items.map((e) => OneSlider.fromJson(e)).toList();
        }
    }
    catch(e)
    {
      print('${e},error intro slidder');
    }
  }
  //sliderItems
contactUsApi(BuildContext context,var name,var email,var phone,var message)async
{
  var bodyItems={
    'name':name,
    'email':email,
    'phone':phone,
    'message':message,
  };
  try{
    final response =await httpRequest.post('${urlBase}/contactUs',headers: headersMapWithOutToken,body:bodyItems );
    if(response.statusCode==200&&response.body!=null)
      {
        if(json.decode(response.body)['statusCode']==200)
          {
            Toast.show(
                json.decode(response.body)['message'],
                context,
                duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM);
            Navigator.of(context).pop();
          }
      }
  }
  catch(e)
  {
    print('${e},,error contact us');
  }
}

Future<List<NotificationItemModel>>getNotificationsApi()async
{
try
    {
      final response = await httpRequest.get('${urlBase}/getNotifications'
          ,headers:await headerWithToken());
      if(response.body!=null&&response.statusCode==200)
        {
          List data = json.decode(response.body)['notifications'];
          return data.map((e) => NotificationItemModel.fromJson(e)).toList();
        }
    }
    catch(e)
  {
    print('${e},,error ntotifications');
  }
}
}