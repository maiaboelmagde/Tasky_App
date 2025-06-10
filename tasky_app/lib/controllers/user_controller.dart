import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/services/preferences_manager.dart';


final prefs = PreferencesManager();

class UserController {
  
  static final ValueNotifier<String> userNameNotifier = ValueNotifier<String>(
    prefs.getString(StorageKey.userName) ?? 'userName',
  );

  static setUserName(String value){
    userNameNotifier.value = value;
    prefs.setString(StorageKey.userName, value);
  }

  static final ValueNotifier<String> motifationQuote = ValueNotifier<String>(
    prefs.getString(StorageKey.motivationQuote) ?? 'Quote',
  );

  static setMotivayionQuote(String value){
    motifationQuote.value = value;
    prefs.setString(StorageKey.motivationQuote, value);
  }
}