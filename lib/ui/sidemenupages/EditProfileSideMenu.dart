import 'dart:io';

import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/TextFieldFormUi.dart';
import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
 class EditProfileSideMenu extends StatefulWidget {
  @override
  _EditProfileSideMenuState createState() => _EditProfileSideMenuState();
}

class _EditProfileSideMenuState extends State<EditProfileSideMenu> {
  File selectedImage;
  final textNameController = TextEditingController();
  final textPhoneController = TextEditingController();
  final textEmailController = TextEditingController();
  final phoneFocus=FocusNode();
  final emailFocus=FocusNode();
  final formKeyEdit = GlobalKey<FormState>();
  AccountProvider accountProvider;
  var imageUrl='';
  init()async
  {
    await Future.delayed(Duration(milliseconds: 200));
    accountProvider=Provider.of<AccountProvider>(context,listen:false);
    textNameController.text=accountProvider.nameUser;
    textPhoneController.text=accountProvider.phoneUser;
    textEmailController.text=accountProvider.emailUser;
    setState(() {
      imageUrl=accountProvider.imageUser;
    });
   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();

  }
  addImage()async
  {
    var profileImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = profileImage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar:PreferredSize(child:  commonAppBarUi(
        DemoLocalizations.of(context).title['editProfile'],
        context
    ),
      preferredSize: Size.fromHeight(50),),body: SingleChildScrollView(
        child: Column( children: [
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
                  placeholder: 'assets/images/logo.png',
                  fit: BoxFit.cover,width:130.0,
                  height:130.0,

                  image: imageUrl)
              ,),
          ),
          Positioned(right: 5.0,bottom: 0.0,
            child: GestureDetector(onTap: (){
              addImage();
            },
              child: Container(padding: EdgeInsets.all(10.0),child: Icon(Icons.camera_alt,
                color: Colors.white,size: 15.0,)
                ,decoration: BoxDecoration(color: Theme.of(context).accentColor
                    ,borderRadius: BorderRadius.circular(50.0)),),
            ),
          ),


        ],),
          SizedBox(height:30.0,),
          Divider(thickness: 1.0,color: Colors.grey.withOpacity(0.5),),


        Container(padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child:  Form(key: formKeyEdit,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Text(DemoLocalizations.of(context).title['name']
                        ,style: TextStyle(fontSize: 14.0,color: Colors.black87  )),
                    SizedBox(height: 10.0,),
                     TextFieldFormUi(fontSizeError:12.0,contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 5.0,
                      errorTitle: DemoLocalizations.of(context).title['namerequired'],
                      hintValue:DemoLocalizations.of(context).title['name'] ,
                      isSecure: false,textInputType: TextInputType.text,
                      prefixIcon:null
                      ,textEditingController: textNameController,suffixIcon:Icon(Icons.edit,),
                      ownFocusNode: null,focusNode: phoneFocus,),
                    SizedBox(height: 20.0,),
//                    Text(DemoLocalizations.of(context).title['PhoneNumber']
//                      ,style:TextStyle(fontSize: 14.0,color: Colors.black87  )),
//                    SizedBox(height: 10.0,),
//                    TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 5.0,
//                      errorTitle: DemoLocalizations.of(context).title['phonerequired'],
//                      hintValue:DemoLocalizations.of(context).title['PhoneNumber'] ,
//                      isSecure: false,textInputType: TextInputType.phone,
//                      prefixIcon:null
//                      ,textEditingController: textPhoneController,suffixIcon:Icon(Icons.edit, ),
//                      ownFocusNode: phoneFocus,focusNode: emailFocus,),
                  //  SizedBox(height: 20.0,),
                    Text(DemoLocalizations.of(context).title['email']
                      ,style: TextStyle(fontSize: 14.0,color: Colors.black87  )),
                    SizedBox(height: 10.0,),
                    TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 5.0,
                      errorTitle: DemoLocalizations.of(context).title['emailrequired'],
                      hintValue:DemoLocalizations.of(context).title['email'] ,
                      isSecure: false,textInputType: TextInputType.emailAddress,
                      prefixIcon:null
                      ,textEditingController: textEmailController,suffixIcon:Icon(Icons.edit,),
                      ownFocusNode: emailFocus,focusNode: FocusNode(),),






            ],),
          ),
        ),
        SizedBox(height:80.0,),

        Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
            Consumer<AccountProvider>(builder: (context ,account,widgetUi){return
              ButtonUi(doubleValue: MediaQuery.of(context).size.width *0.4,backColor:Theme.of(context).accentColor
                ,        function: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  if(!formKeyEdit.currentState.validate())
                  {
                    return;
                  }
                  formKeyEdit.currentState.save();
                  account.updateProfileFunction(context,textNameController.text.toString(),
                  textEmailController.text.toString(),selectedImage
                  );
//                  Toast.show(
//                      DemoLocalizations.of(context).title['Modifiedsuccessfully'],
//                      context,
//                      duration: Toast.LENGTH_LONG,
//                      gravity: Toast.BOTTOM);
//                  Navigator.of(context).pop();
//                  Navigator.of(context).pop();


                },
                widget:  Text(DemoLocalizations.of(context).title['SavveData']
                  ,style: TextStyle(color: Colors.white,fontSize: 14.0
                  ),), );}),
            ButtonUi(doubleValue: MediaQuery.of(context).size.width *0.4,backColor:Theme.of(context).primaryColor
              ,        function: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.of(context).pop();

              },
              widget:  Text(DemoLocalizations.of(context).title['cancell']
                ,style: TextStyle(color: Colors.white,fontSize: 14.0
                ),), )
          ],
        ),
    ],),
      ),));
  }
}
