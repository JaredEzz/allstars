import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:allstars/model/settings.dart';

class SettingsBusiness {

  //Singleton pattern --
  static final SettingsBusiness _settingsBusiness = SettingsBusiness._internal();

  factory SettingsBusiness() {
    return _settingsBusiness;
  }

  SettingsBusiness._internal();
  //--

  Settings settings;

  Settings getSettings(){
    if (settings != null){
      return settings;
    } else {
      createSettings();
      return settings;
    }
  }

  void createSettings() {
    settings = Settings();
  }

  void setPokedexScrollOffset(double offset) { settings.pokedexScrollOffset = offset; }
}


