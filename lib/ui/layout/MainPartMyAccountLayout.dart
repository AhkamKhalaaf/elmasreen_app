import 'dart:io';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/sidemenupages/EditProfileSideMenu.dart';


import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
  import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../NewPasswordUI.dart';
import 'DataAccountLayout.dart';

class MainPartMyAccountLayout extends StatefulWidget {
  @override
  _MainPartMyAccountLayoutState createState() => _MainPartMyAccountLayoutState();
}

class _MainPartMyAccountLayoutState extends State<MainPartMyAccountLayout> {
  File selectedImage;

  addImage()async
 {
   var profileImage = await ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {
     selectedImage = profileImage;
   });
 }
  @override
  Widget build(BuildContext context) {
    return   Consumer<AccountProvider>(builder: (context,account,widget){
      return Column( children: [
        SizedBox(height: 40.0,),
        Stack(overflow: Overflow.visible
          ,children: [
            Container(width: 130.0,height: 130.0,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0),
                border: Border.all(width: 5.0,color: Theme.of(context).primaryColor)),
              child: ClipRRect(borderRadius: BorderRadius.circular(100.0),
                child:  selectedImage != null
                    ? Image.file(
                  selectedImage,width: 130.0,height: 130.0,
                  fit: BoxFit.fill,
                ):FadeInImage.assetNetwork(
                    placeholder: 'assets/images/looding.gif',
                    fit: BoxFit.cover,width:130.0,
      height:130.0,

                    image: account.imageUser)
                ,),
            ),

//            Positioned(right: 5.0,bottom: 0.0,
//              child: GestureDetector(onTap: (){
//                addImage();
//              },
//                child: Container(padding: EdgeInsets.all(10.0),child: Icon(Icons.camera_alt,
//                  color: Colors.white,size: 15.0,)
//                  ,decoration: BoxDecoration(color: Theme.of(context).accentColor
//                      ,borderRadius: BorderRadius.circular(50.0)),),
//              ),
//            ),


          ],),


       // SizedBox(height: 15.0,),
        Container(padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,children: [
//                  Text(DemoLocalizations.of(context).title['name']
//                    ,style: TextStyle(fontSize: 14.0,color: Colors.black87  )),
//                SizedBox(height: 10.0,),
//                 TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 5.0,
//                  errorTitle: DemoLocalizations.of(context).title['namerequired'],
//                  hintValue:DemoLocalizations.of(context).title['name'] ,
//                  isSecure: false,textInputType: TextInputType.text,
//                  prefixIcon:null
//                  ,textEditingController: textNameController,suffixIcon:Icon(Icons.edit,color: colorIcon,),
//                  ownFocusNode: null,focusNode: phoneFocus,),
//                SizedBox(height: 20.0,),
//                Text(DemoLocalizations.of(context).title['PhoneNumber']
//                  ,style:TextStyle(fontSize: 14.0,color: Colors.black87  )),
//                SizedBox(height: 10.0,),
//                TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 5.0,
//                  errorTitle: DemoLocalizations.of(context).title['phonerequired'],
//                  hintValue:DemoLocalizations.of(context).title['PhoneNumber'] ,
//                  isSecure: false,textInputType: TextInputType.phone,
//                  prefixIcon:null
//                  ,textEditingController: textPhoneController,suffixIcon:Icon(Icons.edit,color: colorIcon,),
//                  ownFocusNode: phoneFocus,focusNode: emailFocus,),
//                SizedBox(height: 20.0,),
//                Text(DemoLocalizations.of(context).title['email']
//                  ,style: TextStyle(fontSize: 14.0,color: Colors.black87  )),
//                SizedBox(height: 10.0,),
//                TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 5.0,
//                  errorTitle: DemoLocalizations.of(context).title['emailrequired'],
//                  hintValue:DemoLocalizations.of(context).title['email'] ,
//                  isSecure: false,textInputType: TextInputType.emailAddress,
//                  prefixIcon:null
//                  ,textEditingController: textEmailController,suffixIcon:Icon(Icons.edit,color: colorIcon,),
//                  ownFocusNode: emailFocus,focusNode: FocusNode(),),









//
//
//                  Row(children: [
//                    Expanded(flex: 1,child: Text(DemoLocalizations.of(context).title['name'],style: TextStyle(color: Colors.grey,
//                        fontSize: 12.0),),),
//                    SizedBox(width: 3.0,),
//              Expanded(flex: 4,
//                child: TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 3.0,
//                  errorTitle: DemoLocalizations.of(context).title['passowrdrequired'],
//                  hintValue:DemoLocalizations.of(context).title['pass'] ,
//                  isSecure: false,textInputType: TextInputType.text,
//                  prefixIcon:null
//                  ,textEditingController: textNameController,suffixIcon:null,
//                  ownFocusNode: null,focusNode: phoneFocus,),
//              ),
//                  ],),
//                SizedBox(height: 25.0,),
//                Row(children: [
//                  Expanded(flex: 1,child: Text(DemoLocalizations.of(context).title['PhoneNumber'],style: TextStyle(color: Colors.grey,
//                      fontSize: 12.0),),),
//                  SizedBox(width: 3.0,),
//                  Expanded(flex: 4,
//                    child: TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 3.0,
//                      errorTitle: DemoLocalizations.of(context).title['phonerequired'],
//                      hintValue:DemoLocalizations.of(context).title['PhoneNumber'] ,
//                      isSecure: false,textInputType: TextInputType.text,
//                      prefixIcon:null
//                      ,textEditingController: textNameController,suffixIcon:null,
//                      ownFocusNode: null,focusNode: phoneFocus,),
//                  ),
//                ],),
//                SizedBox(height: 25.0,),
//
//                Row(children: [
//                  Expanded(flex: 1,child: Text(DemoLocalizations.of(context).title['email'],style: TextStyle(color: Colors.grey,
//                      fontSize: 12.0),),),
//                  SizedBox(width: 3.0,),
//                  Expanded(flex: 4,
//                    child: TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 3.0,
//                      errorTitle: DemoLocalizations.of(context).title['emailrequired'],
//                      hintValue:DemoLocalizations.of(context).title['email'] ,
//                      isSecure: false,textInputType: TextInputType.text,
//                      prefixIcon:null
//                      ,textEditingController: textNameController,suffixIcon:null,
//                      ownFocusNode: null,focusNode: phoneFocus,),
//                  ),
//                ],),
            Divider(thickness: 1.0,color: Colors.grey.withOpacity(0.5),),
            SizedBox(height:25.0,),
            DataAccountLayout(title1: DemoLocalizations.of(context).title['name'],
              title2:account.nameUser,),
//            SizedBox(height: 15.0,),
//            DataAccountLayout(title1: DemoLocalizations.of(context).title['pass'],
//              title2: '******',),

            SizedBox(height:25.0,),
            DataAccountLayout(title1: DemoLocalizations.of(context).title['PhoneNumber'],
              title2:account.phoneUser,),

            SizedBox(height: 25.0,),
            DataAccountLayout(title1: DemoLocalizations.of(context).title['email'],
              title2: account.emailUser,),



          ],),
        ),
        SizedBox(height: 20.0,),
        Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
            ButtonUi(doubleValue: MediaQuery.of(context).size.width *0.35,backColor:Theme.of(context).accentColor
              ,        function: (){

                Navigator.push(
                    context, MaterialPageRoute(builder: (BuildContext context)
                => EditProfileSideMenu()));

              },
              widget:  Text(DemoLocalizations.of(context).title['editdata']
                ,style: TextStyle(color: Colors.white,fontSize: 14.0
                ),), ),
            ButtonUi(doubleValue: MediaQuery.of(context).size.width *0.35,backColor:Theme.of(context).primaryColor
              ,        function: (){
//                  FocusScope.of(context).requestFocus(FocusNode());
//                  Navigator.of(context).pop(); NewPasswordUI
                Navigator.push(
                    context, MaterialPageRoute(builder: (BuildContext context)
                => NewPasswordUI(visibleValue: true,userPhone: account.phoneUser,)));
              },
              widget:  Text(DemoLocalizations.of(context).title['changpass']
                ,style: TextStyle(color: Colors.white,fontSize: 14.0
                ),), )
          ],
        ),

        Expanded(child: SizedBox()),
      ],);
    })

     ;
  }
}
