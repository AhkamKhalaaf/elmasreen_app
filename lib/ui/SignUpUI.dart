import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/TextFieldFormUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Values.dart';
import 'componentui/ImagePartUI.dart';
import 'componentui/KeyPhoneUi.dart';
import 'componentui/TextFieldFormEmailUi.dart';
import 'componentui/TextFieldFormPhoneUi.dart';
class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  final textPhoneController = TextEditingController();
  final textEmailController = TextEditingController();
  final textPasswordController = TextEditingController();
  final textConfirmPasswordController = TextEditingController();
  final textUserName = TextEditingController();

  final phoneFocus=FocusNode();
  final emailFocus=FocusNode();
  final passwordFocus=FocusNode();
  final confirmPasswordFocus=FocusNode();
  final formKeySignUp = GlobalKey<FormState>();

  bool isSecure = false;
  AccountProvider accountP ;

  init()async
  {
    await Future.delayed(Duration(milliseconds: 100));
    accountP=Provider.of<AccountProvider>(context,listen:false);
    accountP.changeState(true);
    accountP.deleteErrorPhone();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body:Consumer<AccountProvider>(builder: (context,account,widgetUi){return  Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backintro.png'),
              fit: BoxFit.fill)),width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(child: Padding( padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,children: [
              SizedBox(
                height: 30.0,
              ),
              ImagePartUI(),

              Form(key: formKeySignUp,child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,children: [

                TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,
                  contentPadding: 0.0,max: 1,min: 1,
                  errorTitle: DemoLocalizations.of(context).title['usernamerequired'],
                  hintValue:DemoLocalizations.of(context).title['username_txt'] ,
                  isSecure: false,textInputType: TextInputType.text,
                  prefixIcon: Icon(Icons.person,color: Colors.grey.withOpacity(0.5),)
                  ,textEditingController: textUserName,suffixIcon: null,
                  ownFocusNode: null,focusNode: phoneFocus,),
                SizedBox(height: 20.0,),
                Row( mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Directionality(textDirection: TextDirection.ltr,
                        child: TextFieldFormPhoneUi(suffixIcon: Icon(Icons.phone,
                          color: Colors.grey.withOpacity(0.5),)
                        ,contentPaddingTop: 0.0,max: 1,min: 1,contentPadding: 10.0,
                          errorTitle:'',fontSizeError: 0.0,
                          hintValue:'0123456789' ,
                          isSecure: false,textInputType: TextInputType.phone,
                          prefixIcon: null
                          ,textEditingController: textPhoneController,
                          ownFocusNode: phoneFocus,focusNode: emailFocus,),
                      ),
                    ),
                    SizedBox(width: 3.0,),
                    KeyPhoneUi(),


                  ],
                ),
                Visibility(visible: account.errorPhone,
                  child: Column(
                    children: [
                      SizedBox(
                        height:8.0,
                      ),
                      Text(DemoLocalizations.of(context)
                          .title['phonerequired'],style:TextStyle(height: 1.0, fontWeight: FontWeight.w300,color: Colors.red,
                          fontSize: 12.0)),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                  TextFieldFormEmailUi(fontSizeError: 12.0,contentPaddingTop: 0.0,max: 1,
                    min: 1,contentPadding: 0.0,errorTitle: DemoLocalizations.of(context).title['emailrequired'],hintValue:DemoLocalizations.of(context).title['email'] ,
                  isSecure: false,textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email,color: Colors.grey.withOpacity(0.5),)
                  ,textEditingController: textEmailController,suffixIcon: null,
                  ownFocusNode: emailFocus,focusNode: passwordFocus,),
                SizedBox(height: 20.0,),
                TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,max: 1,min: 1,contentPadding: 0.0,errorTitle: DemoLocalizations.of(context).title['passowrdrequired'],hintValue:DemoLocalizations.of(context).title['pass'] ,
                    isSecure: isSecure,textInputType: TextInputType.text,
                    prefixIcon: Icon(Icons.lock,color: Colors.grey.withOpacity(0.5),)
                    ,textEditingController: textPasswordController,suffixIcon: GestureDetector(onTap: (){
                      setState(() {
                        isSecure=!isSecure;
                      });
                    },
                      child: Icon(isSecure?Icons.visibility_off:Icons.visibility,color: Colors.grey.withOpacity(0.5),),
                    ),
                    ownFocusNode: passwordFocus,focusNode: confirmPasswordFocus),
                SizedBox(height: 20.0,),
                TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,max: 1,min: 1,contentPadding: 0.0,errorTitle: DemoLocalizations.of(context).title['confirmnewpasswordrequired'],hintValue:DemoLocalizations.of(context).title['confirmnewpassword'] ,
                  isSecure: isSecure,textInputType: TextInputType.text,
                  prefixIcon: Icon(Icons.lock,color: Colors.grey.withOpacity(0.5),)
                  ,textEditingController: textConfirmPasswordController,suffixIcon: GestureDetector(onTap: (){
                    setState(() {
                      isSecure=!isSecure;
                    });
                  },
                    child: Icon(isSecure?Icons.visibility_off:Icons.visibility,color: Colors.grey.withOpacity(0.5),),
                  ),
                  ownFocusNode: confirmPasswordFocus,focusNode: FocusNode(),),
              ],)),
              SizedBox(height: 40.0,),

              ButtonUi(doubleValue: MediaQuery.of(context).size.width *0.9,backColor:Theme.of(context).accentColor,
                widget: Text(DemoLocalizations.of(context).title['signUp']
                  ,style: TextStyle(color:skipColorText,
                      fontWeight: FontWeight.bold),)
                ,function: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  if(!formKeySignUp.currentState.validate())
                  {
                    account.changeState(false);
                    account.putErrorPhone( );

                    return;
                  }
                  formKeySignUp.currentState.save();

                  account.changeState(true);
                  account.deleteErrorPhone();
                  //(BuildContext context,var name,var phone,var email,var password)

                  account.signUpFunction(context,textUserName.text.toString(),
                      textPhoneController.text.toString(),textEmailController.text.toString(),
                      textPasswordController.text.trim().toString(),textConfirmPasswordController.text.trim().toString());


                },),
              SizedBox(height: 30.0,),

            ],),
        )),
      ),);})

      ,));
  }
}
