import 'package:flutter/material.dart';
import 'package:tasky_app/core/constants/StorageKey.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';

final prefs = PreferencesManager();

class UserController {
  static reset() {
    prefs.remove(StorageKey.userName);
    prefs.remove(StorageKey.motivationQuote);
    prefs.remove(StorageKey.userImage);

    userNameNotifier.value = prefs.getString(StorageKey.userName) ?? 'userName';
    motifationQuote.value =
        prefs.getString(StorageKey.motivationQuote) ??
        'One task at a time.One step closer.';
    userImageNotifier.value = null;
  }

  static final ValueNotifier<String> userNameNotifier = ValueNotifier<String>(
    prefs.getString(StorageKey.userName) ?? 'userName',
  );

  static setUserName(String value) {
    userNameNotifier.value = value;
    prefs.setString(StorageKey.userName, value);
  }

  static final ValueNotifier<String> motifationQuote = ValueNotifier<String>(
    prefs.getString(StorageKey.motivationQuote) ??
        'One task at a time.One step closer.',
  );

  static setMotivayionQuote(String value) {
    motifationQuote.value = value;
    prefs.setString(StorageKey.motivationQuote, value);
  }

  static final ValueNotifier<String?> userImageNotifier =
      ValueNotifier<String?>(prefs.getString(StorageKey.userImage));

  static setUserImage(String value) {
    userImageNotifier.value = value;
    prefs.setString(StorageKey.userImage, value);
  }
}
