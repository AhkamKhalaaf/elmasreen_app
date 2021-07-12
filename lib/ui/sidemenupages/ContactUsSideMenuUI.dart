import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/TextFieldFormEmailUi.dart';
import 'package:elmasreenapp/ui/componentui/TextFieldFormUi.dart';
import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:toast/toast.dart';
class ContactUsSideMenuUI extends StatefulWidget {
  @override
  _ContactUsSideMenuUIState createState() => _ContactUsSideMenuUIState();
}

class _ContactUsSideMenuUIState extends State<ContactUsSideMenuUI> {
  final textUserName=TextEditingController();
  final textCode=TextEditingController();

  final textUserEmail=TextEditingController();
  final textUserSms=TextEditingController();
  final textPhoneController=TextEditingController();
  final focusEmail=FocusNode();
  final focusPhone=FocusNode();
  final focusSms=FocusNode();
  final formKeyContactUs = GlobalKey<FormState>();
  bool codeVisibility=false;

  @override
  Widget build(BuildContext context) {
    String code = randomAlpha(5);

    return SafeArea(child: Scaffold(appBar:PreferredSize(child:  commonAppBarUi(
        DemoLocalizations.of(context).title['contact_us'],
    context),
        preferredSize: Size.fromHeight(50),),
         body: SingleChildScrollView(
      child: Container(width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
          child:  Form(key: formKeyContactUs,
            child: Column(children: [
              Image.asset('assets/images/fulllogo.png',width: MediaQuery.of(context).size.width * 0.5,

                height:  MediaQuery.of(context).size.width * 0.35,),
              SizedBox(height: 10.0,),
                 Divider(color: Colors.grey.withOpacity(0.5),thickness: 1.0,),
              SizedBox(height: 15.0,),

              TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,contentPadding: 0.0,max: 1,min: 1,errorTitle: DemoLocalizations.of(context).title['usernamerequired'],
                hintValue:DemoLocalizations.of(context).title['username_txt'] ,
                isSecure: false,textInputType: TextInputType.text,
                prefixIcon: Icon(Icons.person,color: Colors.grey.withOpacity(0.5),)
                ,textEditingController: textUserName,suffixIcon: null,
                ownFocusNode: null,focusNode: focusPhone,),
              SizedBox(height:10.0,),
              TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 0.0,min: 1,max: 1,contentPadding: 0.0,errorTitle: DemoLocalizations.of(context).title['phonerequired'],hintValue:DemoLocalizations.of(context).title['PhoneNumber'] ,
                isSecure: false,textInputType: TextInputType.phone,
                prefixIcon: Icon(Icons.phone,color: Colors.grey.withOpacity(0.5),)
                ,textEditingController: textPhoneController,
                ownFocusNode: focusPhone,focusNode: focusEmail,),
              SizedBox(height: 10.0,),
              TextFieldFormEmailUi(fontSizeError: 12.0,contentPaddingTop: 0.0,contentPadding: 0.0,max: 1,min: 1,errorTitle: DemoLocalizations.of(context).title['emailrequired'],
                hintValue:DemoLocalizations.of(context).title['email'] ,
                isSecure: false,textInputType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email,color: Colors.grey.withOpacity(0.5),)
                ,textEditingController: textUserEmail,suffixIcon: null,
                ownFocusNode: focusEmail,focusNode: focusSms,),
              SizedBox(height: 10.0,),





              TextFieldFormUi(fontSizeError: 12.0,contentPaddingTop: 12.0,contentPadding: 12.0,max: 5,min:5,
                errorTitle: DemoLocalizations.of(context).title['sms'],
                hintValue:DemoLocalizations.of(context).title['sms'] ,
                isSecure: false,textInputType: TextInputType.emailAddress,
                prefixIcon: null
                ,textEditingController: textUserSms,suffixIcon: null,
                ownFocusNode: focusSms,focusNode: FocusNode(),),
              SizedBox(height:20.0,),

              Row(
                  children: [
                  Expanded(
                    child: Container(
                    alignment: Alignment.center,
                    child: HBCheckCode(
                      code: code,
                    )),
                  ),
              SizedBox(width: 15.0,),
                    Container(width: MediaQuery.of(context).size.width*0.3,child: TextFormField(onFieldSubmitted: (value){
                      // print('${code},,,,code');
                      //print('${value},,,,dssssssssss');
                      FocusScope.of(context).requestFocus(FocusNode());

                      if(code==value)
                      {
                        Toast.show('تم إدخال الكود بشكل صحيح',
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM);
                        codeVisibility=true;
                        setState(() {

                        });
                      }
                      else
                      {
                        Toast.show(
                            'الكود غير صحيح , حاول مرة آخري',
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM);
                      }
                    }, controller: textCode
                      ,textAlign: TextAlign.center,keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 14.0,color: Colors.black87  ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none ,

                          disabledBorder: InputBorder.none,hintStyle: TextStyle(fontSize: 14.0,color:Colors.grey.withOpacity(0.5)  ),
                          contentPadding:
                          EdgeInsets.only(left: 5,bottom: 8.0,right: 5)),),alignment:Alignment.center
                        ,height: 40.0,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)
                            ,color: Colors.white,border: Border.all(color: Colors.grey.withOpacity(0.5)))),
                    SizedBox(width:15.0,),
              InkWell(
                  onTap: () {
                    textCode.text='';
                    codeVisibility=false;
                    setState(() {});

                  },
                  child: Icon(Icons.refresh,size: 40.0,))]),

              SizedBox(height: 20.0,),
//contactUsApi
              Consumer<AccountProvider>(builder: (context,accountProvider,widgetUi){
                return ButtonUi(widget: Text(DemoLocalizations.of(context).title['send']
                ,style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold),),
                backColor: codeVisibility?Theme.of(context).primaryColor:
                Theme.of(context).primaryColor.withOpacity(0.5),doubleValue: MediaQuery.of(context).size.width *0.9,
                function: (){
                  if( !formKeyContactUs.currentState.validate())
                  {
                    return;
                  }
                  formKeyContactUs.currentState.save();

                  codeVisibility?accountProvider.contactUsApi(context, textUserName.text.toString()
                      , textUserEmail.text.toString(), textPhoneController.text.toString()
                      , textUserSms.text.toString()):Toast.show(
                     'قم بإدخال الكود أولاً',
                      context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM);
                },);
              })
            ],),
          )),
    ),));
  }
}
