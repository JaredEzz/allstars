import 'package:allstars/pages/starPage.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController;
  var currentPage = Pages.HOME;
//  FirebaseAnalytics analytics;
  bool showLeading = false;
  String titleText = "Home";
  bool firstOpen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    analytics = Provider.of<FirebaseAnalytics>(context);

    String welcomeMessage =
        "Thank you for helping to beta test this app! Feel free to look around, find bugs (just let me know about them), and enjoy!";
    return WillPopScope(
        onWillPop: () async {
          if (currentPage == Pages.HOME) {
//            logEvent(context, analytics, "app_closed_from_back_button");
            return true;
          } else if (currentPage == Pages.STARS) {
            setState(() {
              showLeading = false;
              titleText = "Pokédex";
              currentPage = Pages.STARS;
//              logScreenChanged(context, analytics, "stars");
            });
            return false;
          } else {
            setState(() {
//              settings.showAppBar = true;
//              settings.showBottomNavBar = true;
              showLeading = false;
              titleText = "Home";
              currentPage = Pages.HOME;
//              logScreenChanged(context, analytics, "home");
            });
            return false;
          }
        },
        child: Scaffold(
          appBar: null,
          backgroundColor: Colors.white54,
          body: Stack(
            children: <Widget>[
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: buildPageBody(currentPage),
              ),
              firstOpen ? AlertDialog(
                title: Text("Welcome!"),
                titleTextStyle: TextStyle(fontFamily: "ProzaLibre", fontSize: 22, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                content: Column(
                  children: <Widget>[
                    Text(welcomeMessage),
                    SizedBox(height: 10,),
                    Divider(height: 10, color: Colors.black,),
                    SizedBox(height: 10,),
//                    Text("What version of the game are you playing?"),
//                    Padding(
//                      padding: EdgeInsets.symmetric(vertical: 15),
//                      child: CupertinoSegmentedControl<int>(
//                        children: <int,Widget>{
//                          0: Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), child: Text("Let's Go! Eevee", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w700, fontSize: 14), )),
//                          1: Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), child: Text("Let's Go! Pikachu", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w700, fontSize: 12),)),
//                        },
//                        onValueChanged: (int newValue) {
//                          setState(() {
////                            viewValue = newValue;
////                            settings.version = newValue == 0 ? Version.EEVEE : Version.PIKACHU;
////                            UserBusiness().updateVersion(settings.version);
////                            settings.mascot = newValue == 0 ? Image.asset("assets/masterTrainers/eevee_corner.png") : Image.asset("assets/masterTrainers/pikachu_corner.png");
////                            settings.setAccentColor(newValue == 1 ? pikachuColor : eeveeColor);
////                            settings.setBottomAppBarColor(newValue == 1 ? pikachuColor : eeveeColor);
////                            logEvent(context, analytics, "version_changed_${settings.version.toString().substring(settings.version.toString().indexOf(".")+1).toLowerCase()}");
////                            DynamicTheme.of(context).setThemeData(settings.themeData);
//                          });
//                        },
//                        groupValue: viewValue,
//                        borderColor: Colors.black,
//                        selectedColor: DynamicTheme.of(context).brightness == Brightness.dark ? Theme.of(context).accentColor : Colors.black26,
//                        pressedColor: settings.accentColor == pikachuColor ? eeveeColor : pikachuColor,
//                        unselectedColor: Theme.of(context).backgroundColor,
//                      ),
//                    )
//
                  ],
                ),
                contentTextStyle: TextStyle(fontFamily: "OpenSans", fontSize: 15, fontWeight: FontWeight.w400, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("Done"),
                    onPressed: () {
                      //Sign in
//                      _signInAnonymously();
//                      userDAO.createUser();
                      setState(() {
                        firstOpen = false;
                      });
                    },
                  ),
                ],
              ) : Container()
            ],
          ),
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
//                    logScreenChanged(context, analytics, "home");
                    break;
                  case 1:
                    titleText = "About";
                    currentPage = Pages.ABOUT;
//                    logScreenChanged(context, analytics, "about");
                    break;
                  case 2:
                    titleText = "Settings";
                    currentPage = Pages.SETTINGS;
//                    logScreenChanged(context, analytics, "settings");
                    break;
                  default:
                    currentPage = Pages.HOME;
//                    logScreenChanged(context, analytics, "home");
                    break;
                }
              });
            },
          ),
        ));
  }
  Widget buildPageBody(page) {
    switch(page) {
      case Pages.HOME:
        return StarPage();
        break;
      case Pages.STARS:
        return Container();
        break;
      case Pages.ABOUT:
        return Container();
        break;
      case Pages.SETTINGS:
        return Container();
        break;
    }
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
