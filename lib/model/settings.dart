import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class Settings {
  bool showAppBar;
  bool showBottomNavBar;
  bool darkMode;
  Version version;
  Image mascot;
  bool shinyDex;

  ThemeData themeData;
  Brightness brightness;
  Color backgroundColor;
  Color accentColor;
  Color bottomAppBarColor;
  ColorSwatch primarySwatch;

  ///properties for pokedex page
  double pokedexScrollOffset = 0;

  Color eeveeColor = Color.fromRGBO(59, 159, 44, 0.7);
  Color pikachuColor = Color.fromRGBO(92, 194, 20, 0.7);

  Settings(){
    this.showAppBar = true;
    this.showBottomNavBar = true;
    this.bottomAppBarColor = Colors.red;
    this.backgroundColor = Color(0xFFFAFAFA);
    this.primarySwatch = Colors.lightBlue;
    this.version = Version.PIKACHU;
    this.shinyDex = false;
    updateTheme();
  }

  void toggleFullscreen() {
    this.showBottomNavBar = !showBottomNavBar;
    this.showAppBar = !showAppBar;
  }

  void setBrightness(BuildContext context, Brightness b){
    DynamicTheme.of(context).setBrightness(b);
    this.brightness = b;
    updateTheme();
  }

  void setAccentColor(Color c){
    this.accentColor = c;
    updateTheme();
  }

  void setShinyDex(bool s){
    this.shinyDex = s;
  }

  void setBottomAppBarColor(Color c){
    this.bottomAppBarColor = c;
    updateTheme();
  }

  void setBackgroundColor(Color c){
    this.backgroundColor = c;
    updateTheme();
  }

  void setPrimarySwatch(Color c){
    this.primarySwatch = c;
    updateTheme();
  }


  void updateTheme() {
    themeData = ThemeData(
        backgroundColor: backgroundColor,
        brightness: brightness,
        accentColor: accentColor,
        bottomAppBarColor: bottomAppBarColor,
        primarySwatch: primarySwatch

    );
    this.mascot = this.version == Version.EEVEE ? Image.asset("assets/masterTrainers/eevee_corner.png") : Image.asset("assets/masterTrainers/pikachu_corner.png");
//                settings.setAccentColor(newValue == 1 ? Color.fromRGBO(249, 194, 20, 0.7) : Color.fromRGBO(99, 60, 21, 0.7));
//                settings.setBottomAppBarColor(newValue == 1 ? Color.fromRGBO(249, 194, 20, 0.7) : Color.fromRGBO(99, 60, 21, 0.7));
    this.accentColor = (this.version == Version.PIKACHU ? pikachuColor : eeveeColor);
    this.bottomAppBarColor = (this.version == Version.PIKACHU ? pikachuColor : eeveeColor);
  }

}

enum Version {
  PIKACHU,
  EEVEE
}
