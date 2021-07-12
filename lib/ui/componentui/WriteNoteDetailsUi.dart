import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class WriteNoteDetailsUi extends StatelessWidget {
  final TextEditingController textEditingController;

  const WriteNoteDetailsUi({Key key, this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(DemoLocalizations.of(context).title['makenote'],
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w100,
          ))  ,
        SizedBox(height: 15.0,),
        TextFormField( controller: textEditingController, keyboardType: TextInputType.text
          ,obscureText: false,
          textInputAction: TextInputAction.next,
          style: TextStyle(fontSize: 14.0,color: Colors.black87  ),textAlign: TextAlign.start,
          maxLines:2,minLines:2,
          decoration: InputDecoration(hintText:
          DemoLocalizations.of(context).title['Wouldyouliketotellusanythingelse?'],
              prefixIcon: Icon(Icons.sms,color: Colors.grey,size:30.0,),
              hintStyle: TextStyle(fontSize: 14.0,color:Colors.grey.withOpacity(0.5)  ),
              contentPadding: EdgeInsets.only(left:5.0,right: 5.0,top: 30.0,bottom: 5.0),
               disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:
              Colors.grey.withOpacity(0.5)  ,width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:
              Colors.grey.withOpacity(0.5)  ,width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color:
              Colors.red  ,width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 0.0),
                  borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(borderSide:
              BorderSide(color:Colors.grey.withOpacity(0.5) ,width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
              border:OutlineInputBorder(borderSide: BorderSide(color:
              Colors.grey.withOpacity(0.5)  ,width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),enabled: true,filled: true,
              fillColor: Colors.white),),
      ],
    );
  }
}
