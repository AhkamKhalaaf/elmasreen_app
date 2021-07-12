import 'package:flutter/cupertino.dart';

class LogProvider extends ChangeNotifier
{
  bool clickStatus=true;
  bool logStatus=false;
  showStatus()
  {
    clickStatus=false;
    logStatus=true;
    notifyListeners();
  }

  hideStatus()
  {
    clickStatus=true;
    logStatus=false;
    notifyListeners();
  }
}