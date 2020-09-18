import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:provider/provider.dart';


import 'business/settingsBusiness.dart';
import 'model/settings.dart';
import 'pages/home.dart';

void main() {
  runApp(AllStarsApp());
}

class AllStarsApp extends StatelessWidget {
//  static FirebaseAnalytics analytics = FirebaseAnalytics();
//  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    String eventName = Platform.isAndroid ? "android_app_started" : "ios_device_started";
//    logEvent(context, analytics, eventName);
    Settings settings = SettingsBusiness().getSettings();
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        brightness: brightness,
        primarySwatch: settings.primarySwatch,
        backgroundColor: settings.backgroundColor,
        accentColor: settings.accentColor,
        bottomAppBarColor: settings.bottomAppBarColor
      ),
      themedWidgetBuilder: (context, theme){
        return MultiProvider(
          providers: [
            Provider(builder: (context) => SettingsBusiness()),
//            Provider(builder: (context) => FirebaseAnalytics()),
          ],
          child: MaterialApp(
//            navigatorObservers: [
//              observer
//            ],
            title: "3D All Stars Completionist",
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: HomePage(),
          ),
        );
      },
    );
  }

}
//
//Future<void> logEvent(BuildContext context, FirebaseAnalytics analytics, String eventName) async {
//  await analytics.logEvent(
//      name: eventName
//  );
//  debugPrint('event: $eventName - sent');
//}
//Future<void> logEventWithParams(BuildContext context, FirebaseAnalytics analytics, String eventName, Map<String,dynamic> parameters) async {
//  await analytics.logEvent(
//      name: eventName,
//      parameters: parameters
//  );
//  debugPrint('event: $eventName - sent');
//}
//Future<void> logScreenChanged(BuildContext context, FirebaseAnalytics analytics, String screenTag) async {
//  await analytics.logEvent(
//      name: screenTag+"_opened"
//  );
//  debugPrint('screen open: $screenTag - sent');
//}
