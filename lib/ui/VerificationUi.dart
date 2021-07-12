import 'dart:async';

import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/NewPasswordUI.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../Values.dart';
import 'HomePageUI.dart';
import 'componentui/ImagePartUI.dart';

class VerificationUi extends StatefulWidget {
  final String typeVerification;
  final String phone;

  const VerificationUi({Key key, this.typeVerification, this.phone}) : super(key: key);

   @override
  _VerificationUiState createState() => _VerificationUiState();
}

class _VerificationUiState extends State<VerificationUi> {
  String currentText = "";
  FocusNode keyboardFocus=FocusNode();
 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    keyboardFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container( decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/backintro.png'),
            fit: BoxFit.fill)),
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height ,
      child:  Padding(padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.075,
          right: MediaQuery.of(context).size.width * 0.075),
        child: Center(child: SingleChildScrollView(child: Column(children: [
          SizedBox(
            height: 30.0,
          ),
          ImagePartUI(),
          SizedBox(height: 10.0,),
          Text(DemoLocalizations.of(context).title['activaccount'],style: TextStyle(color:Theme.of(context).primaryColor ),),
          SizedBox(height: 20.0,),
          Text(DemoLocalizations.of(context).title['entertheccode']),
          Text(DemoLocalizations.of(context).title['whicissent']),
          Text(widget.phone),
          SizedBox(height: 20.0,),
          Directionality(
              textDirection: TextDirection.ltr,
              child: PinCodeTextField( focusNode: keyboardFocus,
                length: 6,pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,activeColor: Theme.of(context).accentColor,
                    selectedColor:Theme.of(context).accentColor ,inactiveColor:Theme.of(context).primaryColor  ,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 45,
                  fieldWidth: 45,

                ),
                backgroundColor: Colors.white,
                 textInputAction: TextInputAction.done,

                animationType: AnimationType.fade,
                 animationDuration: Duration(milliseconds: 100),

                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },

              ),
            ),


          SizedBox(height: 60.0,),

          Consumer<AccountProvider>(builder: (context,accountProvider,uiWidget){
            return ButtonUi(backColor:Theme.of(context).accentColor,
              widget:  Text(DemoLocalizations.of(context).title['confirm']
                ,style: TextStyle(color: skipColorText,
                    fontWeight: FontWeight.bold),)
              ,function: (){

                if(currentText!='' &&currentText.length==6)
                {
  accountProvider.accountVerficationFunction(context, widget.phone, currentText,
                      widget.typeVerification);





                }


                else{
                  FocusScope.of(context).requestFocus(FocusNode());
                  Toast.show(
                      DemoLocalizations.of(context).title['enterfullcode'],
                      context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM);
                }

              },);}),
          SizedBox(height: 30.0,),

        ],),),),
      ),)
    ));
  }
}
