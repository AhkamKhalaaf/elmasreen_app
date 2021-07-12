import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../Values.dart';
import 'componentui/ButtonUi.dart';
import 'componentui/ImagePartUI.dart';
import 'componentui/TextFieldFormUi.dart';
import 'layout/CommonAppBarUi.dart';
class NewPasswordUI extends StatefulWidget {
  final bool visibleValue;
  final String userPhone;

  const NewPasswordUI({Key key, this.visibleValue, this.userPhone}) : super(key: key);


   @override
  _NewPasswordUIState createState() => _NewPasswordUIState();
}

class _NewPasswordUIState extends State<NewPasswordUI> {
  final textOldController = TextEditingController();
  final textNewController = TextEditingController();

  final textNewConfirmController = TextEditingController();
final newPasswordFocus=FocusNode();
  final newConfirmPasswordFocus=FocusNode();
  final formKeyNewPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar:PreferredSize(child:commonAppBarUi(
        DemoLocalizations.of(context).title['changepassword'],
        context
    ),
      preferredSize: Size.fromHeight(50),),
        body: Container(
        alignment: Alignment.center,width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        color: Colors.white,
            child: SingleChildScrollView(
              child:  Form(key: formKeyNewPassword,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,children: [
                     ImagePartUI(),
                    SizedBox(height:10.0,),
                    Visibility(visible: widget.visibleValue,
                      child: Column(
                        children: [
                          TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 0.0,
                            errorTitle: DemoLocalizations.of(context).title['oldPasswordrequired'],
                            hintValue:DemoLocalizations.of(context).title['oldPassword'] ,
                            isSecure: false,textInputType: TextInputType.text,
                            prefixIcon: Icon(Icons.lock,color: Colors.grey.withOpacity(0.5),)
                            ,textEditingController: textOldController,suffixIcon:null,
                            ownFocusNode: null,focusNode: newPasswordFocus,),
                          SizedBox(height: 20.0,),
                        ],
                      ),
                    ),

                    TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 0.0,
                      errorTitle: DemoLocalizations.of(context).title['newpasswordrequired'],
                      hintValue:DemoLocalizations.of(context).title['newPassword'] ,
                      isSecure: false,textInputType: TextInputType.text,
                      prefixIcon: Icon(Icons.lock,color: Colors.grey.withOpacity(0.5),)
                      ,textEditingController: textNewController,suffixIcon:null,
                      ownFocusNode: newPasswordFocus,focusNode: newConfirmPasswordFocus,),
                    SizedBox(height: 20.0,),
                    TextFieldFormUi(contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 0.0,
                      errorTitle: DemoLocalizations.of(context).title['confirm_passrequired'],
                      hintValue:DemoLocalizations.of(context).title['confirm_pass'] ,
                      isSecure: false,textInputType: TextInputType.text,
                      prefixIcon: Icon(Icons.lock,color: Colors.grey.withOpacity(0.5),)
                      ,textEditingController: textNewConfirmController,suffixIcon:null,
                      ownFocusNode: newConfirmPasswordFocus,focusNode: FocusNode(),),
                    SizedBox(height:40.0,),

                   Consumer<AccountProvider>(builder: (context,account,widgetUI){
                     return  ButtonUi(doubleValue: MediaQuery.of(context).size.width *0.9,
                     backColor: Theme.of(context).accentColor,
                     widget: Text(DemoLocalizations.of(context).title['savedata']
                       ,style: TextStyle(color:skipColorText,
                           fontWeight: FontWeight.bold),) ,function: (){
                       FocusScope.of(context).requestFocus(FocusNode());
                       if(!formKeyNewPassword.currentState.validate())
                       {
                         return;
                       }
                       formKeyNewPassword.currentState.save();
                        !widget.visibleValue?account.resetPasswordFunction(context,widget.userPhone
                        , textNewController.text.toString(),  textNewConfirmController.text.toString()):
                        account.changePasswordFunction(context, textOldController.text.toString()
                        , textNewController.text.toString(), textNewConfirmController.text.toString());


                     },);
                   }),
                    SizedBox(height:20.0,),

                  ],),
                ),

            ),),));
  }
}
