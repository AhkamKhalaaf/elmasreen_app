import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Values.dart';
import 'VerificationUi.dart';
import 'componentui/ButtonUi.dart';
import 'componentui/ImagePartUI.dart';
import 'componentui/KeyPhoneUi.dart';
import 'componentui/TextFieldFormPhoneUi.dart';
import 'componentui/TextFieldFormUi.dart';
import 'layout/CommonAppBarUi.dart';

class LostPasswordUi extends StatefulWidget {
  @override
  _LostPasswordUiState createState() => _LostPasswordUiState();
}

class _LostPasswordUiState extends State<LostPasswordUi> {
  final textEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AccountProvider accountPr;

  init() async {
    await Future.delayed(Duration(milliseconds: 100));
    accountPr = Provider.of<AccountProvider>(context, listen: false);
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
        child: Scaffold(
      appBar: PreferredSize(
        child: commonAppBarUi(
            DemoLocalizations.of(context).title['lost_pass'], context),
        preferredSize: Size.fromHeight(50),
      ),
      body: Consumer<AccountProvider>(
        builder: (context, account, widgetUi) {
          return Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//        Text(DemoLocalizations.of(context).title['lost_pass'],style: TextStyle(fontWeight: FontWeight.bold,
//            fontSize: 20.0,color: Colors.black),),
                    SizedBox(
                      height: 30.0,
                    ),
                    ImagePartUI(),
                    SizedBox(
                      height: 10.0,
                    ),

                    Text(
                      DemoLocalizations.of(context).title['codewillbesent'],
                      style: TextStyle(color: Colors.black87),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Expanded(
                                  child: TextFieldFormPhoneUi(fontSizeError: 0.0,
                                    contentPaddingTop: 0.0,
                                    min: 1,
                                    max: 1,
                                    contentPadding: 10.0,
                                    errorTitle: null,
                                    hintValue: '0123456789',
                                    isSecure: false,
                                    textInputType: TextInputType.phone,
                                    prefixIcon: null,
                                    textEditingController: textEmailController,
                                    suffixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    ownFocusNode: null,
                                    focusNode: FocusNode(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.0,
                              ),
                              KeyPhoneUi(),
                            ],
                          ),
                          Visibility(
                            visible: account.errorPhone,
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
                      ),
                    ),

                    SizedBox(
                      height: 30.0,
                    ),

                    ButtonUi(
                      doubleValue: MediaQuery.of(context).size.width * 0.9,
                      backColor: Theme.of(context).accentColor,
                      widget: Text(
                        DemoLocalizations.of(context).title['changepassword'],
                        style: TextStyle(
                            color: skipColorText, fontWeight: FontWeight.bold),
                      ),
                      function: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        //print('${textEmailController.text},,,ppp');
                        if (!formKey.currentState.validate()) {
                          accountPr.changeState(false);
                          accountPr.putErrorPhone();

                          return;
                        }
                        formKey.currentState.save();
                        accountPr.changeState(true);
                        accountPr.deleteErrorPhone();

                      accountPr.resetPasswordVerficationFunction(context, textEmailController.text);
                      },
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ));
        },
      ),
    ));
  }
}
