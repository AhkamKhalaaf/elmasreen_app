import 'dart:ui';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/HomePageUI.dart';
import 'package:elmasreenapp/ui/SignUpUI.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/TextFieldFormUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../Values.dart';
import 'LostPasswordUi.dart';
import 'componentui/ImagePartUI.dart';
import 'componentui/KeyPhoneUi.dart';
import 'componentui/TextFieldFormPhoneUi.dart';

class LoginPageUI extends StatefulWidget {
  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  final textPhoneController = TextEditingController();
  final textPasswordController = TextEditingController();

  final passwordFocus = FocusNode();
  final formKeySignUp = GlobalKey<FormState>();
  bool isSecure = false;
  AccountProvider accountPr ;
  init()async
  {
    await Future.delayed(Duration(milliseconds: 100));
    accountPr=Provider.of<AccountProvider>(context,listen:false);
    accountPr.changeState(true);
    accountPr.deleteErrorPhone();

  }
   //putErrorPhone
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
   @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(onWillPop: ()async{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomePageUI()), (Route<dynamic> route) => false);
          return true;
        },
          child: Scaffold(
      body: Consumer<AccountProvider>(builder: (context,account ,widgetUi){return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backintro.png'),
                  fit: BoxFit.fill)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      ImagePartUI(),
                      SizedBox(
                        height:10.0,
                      ),
                      Form(
                          key: formKeySignUp,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Directionality(textDirection: TextDirection.ltr,
                                      child: TextFieldFormPhoneUi( fontSizeError: 0.0,suffixIcon:  Icon(
                                        Icons.phone,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                        contentPaddingTop: 0.0,
                                        min: 1,
                                        max: 1,
                                        contentPadding: 10.0,
                                        errorTitle:'',
                                        hintValue: '0123456789',
//                                DemoLocalizations.of(context)
//                                    .title['PhoneNumber'],
                                        isSecure: false,
                                        textInputType: TextInputType.phone,
                                        prefixIcon:null,
                                        textEditingController: textPhoneController,
                                        ownFocusNode: null,
                                        focusNode: passwordFocus,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  KeyPhoneUi(),
                                ],
                              ),

                              Visibility(visible: account.errorPhone,
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
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFieldFormUi(
                                contentPaddingTop: 0.0,fontSizeError: 12.0,
                                min: 1,
                                max: 1,
                                contentPadding: 0.0,
                                errorTitle: DemoLocalizations.of(context)
                                    .title['passowrdrequired'],
                                hintValue:
                                DemoLocalizations.of(context).title['pass'],
                                isSecure: isSecure,
                                textInputType: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                textEditingController: textPasswordController,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSecure = !isSecure;
                                    });
                                  },
                                  child: Icon(
                                    isSecure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                                ownFocusNode: passwordFocus,
                                focusNode: FocusNode(),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          //LostPasswordUi
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LostPasswordUi()));
                        },
                        child: Text(
                          DemoLocalizations.of(context).title['lost_password'],
                          style: TextStyle(color: skipColorText),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ButtonUi(
                        doubleValue: MediaQuery.of(context).size.width * 0.9,
                        backColor: Theme.of(context).accentColor,
                        widget: Text(
                          DemoLocalizations.of(context).title['btn_login'],
                          style: TextStyle(
                              color: skipColorText, fontWeight: FontWeight.bold),
                        ),
                        function: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (!formKeySignUp.currentState.validate()) {
                            account.changeState(false);
                            account.putErrorPhone();
                            //    print('${accountProvider.stateForm},,,,state');
                            return;
                          }
                          formKeySignUp.currentState.save();
                          account.changeState(true);
                          account.deleteErrorPhone();
                          //  print('${accountProvider.stateForm},,,,state');

                           account.loginFunction(context,
                               textPhoneController.text.toString(),
                              textPasswordController.text.toString());
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ButtonUi(
                        widget: Text(
                          DemoLocalizations.of(context).title['signUp'],
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                        ),
                        doubleValue: MediaQuery.of(context).size.width * 0.9,
                        backColor: skipColorText,
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => SignUpUI()));
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                )),
          ),
      );
      }),
    ),
        ));
  }
}
