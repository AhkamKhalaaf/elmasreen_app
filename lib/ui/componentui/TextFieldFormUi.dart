import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class TextFieldFormUi extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final FocusNode ownFocusNode;
  final String hintValue;
  final bool isSecure;
  final TextInputType textInputType;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String errorTitle;
  final int max;
  final int min;
  final double contentPadding;
  final double contentPaddingTop;
  final double fontSizeError;

  const TextFieldFormUi({Key key, this.textEditingController, this.focusNode, this.ownFocusNode
    , this.hintValue, this.isSecure, this.textInputType, this.prefixIcon, this.suffixIcon,
    this.errorTitle, this.max, this.min, this.contentPadding,
    this.contentPaddingTop, this.fontSizeError}) : super(key: key);








  @override
  Widget build(BuildContext context) {
    return TextFormField(focusNode:ownFocusNode ,onFieldSubmitted: (value){
      FocusScope.of(context).requestFocus(focusNode);
    },controller: textEditingController,validator: (value) {
      if (value.isEmpty) {
        return errorTitle;
      }

      return null;
    },keyboardType: textInputType,obscureText: isSecure,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: 14.0,color: Colors.black87  ),maxLines:max,minLines: min ,
      decoration: InputDecoration(hintText: hintValue,
          prefixIcon: prefixIcon,errorStyle: TextStyle(
              height: 1.0,
              fontWeight: FontWeight.w300,color: Colors.red,
              fontSize:fontSizeError),
          hintStyle: TextStyle(fontSize: 14.0,color:Colors.grey.withOpacity(0.5)  ),
           contentPadding: EdgeInsets.only(left:contentPadding,right: contentPadding,top: contentPaddingTop),
          suffixIcon: suffixIcon,
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
          fillColor: Colors.white),);
  }
}
