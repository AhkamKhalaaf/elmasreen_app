import 'package:elmasreenapp/ui/SplashUi.dart';
import 'package:elmasreenapp/ui/layout/BackGroundLayout.dart';
import 'package:elmasreenapp/utils/app_LocalizationDeledate.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providermodels/AccountProvider.dart';
import 'core/providermodels/AddressProvider.dart';
import 'core/providermodels/CartProvider.dart';
import 'core/providermodels/CategoryProvider.dart';
import 'core/providermodels/LogProvider.dart';

void main() {
//

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => AccountProvider()),
      ChangeNotifierProvider(create: (context) => AddressProvider()),
      ChangeNotifierProvider(create: (context) => LogProvider()),
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ],
    child: MyApp(),
  ));
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences sharedPreferences;
  String _message = '';
  String _tokenAccess = '';
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() async {
    await _firebaseMessaging.getToken().then((token) {
      SharedPreferences.getInstance().then((shared) {
        shared.setString('tokennotification', token);
      });

      print('${token},,,,,,toookkk');
    });
  }

  void getMessage() async {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        showNotificationsFunc(message);
        print('on message $message');
        setState(() => _message = message["notification"]["title"]);
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
        setState(() => _message = message["notification"]["title"]);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
        setState(() => _message = message["notification"]["title"]);
      },
//        onBackgroundMessage:(Map<String, dynamic> message) async {
//      print('on launch $message');
//      setState(() => _message = message["notification"]["title"]);
//    }
    );
  }

  showNotificationsFunc(Map<String, dynamic> message) async {
    var android = AndroidNotificationDetails(
        'channel_id', 'CHANNEL_NAME', 'channelDescription');
    var ios = IOSNotificationDetails();
    var platform = new NotificationDetails(android, ios);
    await flutterLocalNotificationsPlugin.show(
        0,
        message['notification']['title'].toString(),
        message['notification']['body'].toString(),
        platform);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var android = new AndroidInitializationSettings('mipmap/launcher_icon');
    var ios = IOSInitializationSettings();
    var platform = InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);
    getMessage();
    _register();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", ""), // OR Locale('ar', 'AE') OR Other RTL locales
        Locale("ar", ""),
      ],
      locale: Locale("ar", ""),
      theme: ThemeData(
        iconTheme: IconThemeData(size: 20.0),
        fontFamily: 'mainfont',
        primaryColor: Color(0xff32A747),
        accentColor: Color(0xff1b173d),
        textTheme: TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 12.0),
            headline2: TextStyle(color: Colors.black87, fontSize: 12.0),
            headline3: TextStyle(
                color: Colors.black.withOpacity(0.75),
                fontSize: 10.0,
                fontWeight: FontWeight.w100),
            headline4:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 8.0),
            headline5: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w200,
                fontSize: 16.0)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          // HomePageUI()
          SplashUi(
        backWidget: BackGroundLayout(
          pathImage: 'assets/images/backsplashimage.png',
        ),
        logoPath: 'assets/images/fulllogo.png',
      ),
    );
  }
}
