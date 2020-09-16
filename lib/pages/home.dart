import 'package:allstars/model/star.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController;
  var currentPage = Pages.HOME;
  FirebaseAnalytics analytics;
  bool showLeading = false;
  String titleText = "Home";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    analytics = Provider.of<FirebaseAnalytics>(context);

    String welcomeMessage =
        "Thank you for helping to beta test this app! Feel free to look around, find bugs (just let me know about them), and enjoy!";
    return WillPopScope(
        onWillPop: () async {
          if (currentPage == Pages.HOME) {
            logEvent(context, analytics, "app_closed_from_back_button");
            return true;
          } else if (currentPage == Pages.STARS) {
            setState(() {
              showLeading = false;
              titleText = "Pokédex";
              currentPage = Pages.STARS;
              logScreenChanged(context, analytics, "stars");
            });
            return false;
          } else {
            setState(() {
//              settings.showAppBar = true;
//              settings.showBottomNavBar = true;
              showLeading = false;
              titleText = "Home";
              currentPage = Pages.HOME;
              logScreenChanged(context, analytics, "home");
            });
            return false;
          }
        },
        child: Scaffold(
          appBar: null,
          backgroundColor: Colors.white54,
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Theme.of(context).bottomAppBarColor,
            inactiveIconColor: Theme.of(context).bottomAppBarColor,
            tabs: [
              TabData(iconData: Icons.home, title: "Home"),
              TabData(iconData: Icons.info, title: "About"),
              TabData(iconData: Icons.settings, title: "Settings")
            ],
            onTabChangedListener: (position) {
              setState(() {
                switch (position) {
                  case 0:
                    titleText = "Home";
                    showLeading = false;
                    currentPage = Pages.HOME;
                    logScreenChanged(context, analytics, "home");
                    break;
                  case 1:
                    titleText = "About";
                    currentPage = Pages.ABOUT;
                    logScreenChanged(context, analytics, "about");
                    break;
                  case 2:
                    titleText = "Settings";
                    currentPage = Pages.SETTINGS;
                    logScreenChanged(context, analytics, "settings");
                    break;
                  default:
                    currentPage = Pages.HOME;
                    logScreenChanged(context, analytics, "home");
                    break;
                }
              });
            },
          ),
        ));
  }
}

enum Pages { HOME, STARS, ABOUT, SETTINGS }

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}
