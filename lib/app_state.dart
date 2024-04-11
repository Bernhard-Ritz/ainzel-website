import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _activeLanguage = prefs.getString('ff_activeLanguage') ?? _activeLanguage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _activeLanguage = 'EN';
  String get activeLanguage => _activeLanguage;
  set activeLanguage(String value) {
    _activeLanguage = value;
    prefs.setString('ff_activeLanguage', value);
  }

  String _templateName = 'Credit WriteUp';
  String get templateName => _templateName;
  set templateName(String value) {
    _templateName = value;
  }

  int _screenWidthModeSwitch = 600;
  int get screenWidthModeSwitch => _screenWidthModeSwitch;
  set screenWidthModeSwitch(int value) {
    _screenWidthModeSwitch = value;
  }

  String _appDomainMode = 'Generic';
  String get appDomainMode => _appDomainMode;
  set appDomainMode(String value) {
    _appDomainMode = value;
  }

  bool _iPhoneMenuVisible = false;
  bool get iPhoneMenuVisible => _iPhoneMenuVisible;
  set iPhoneMenuVisible(bool value) {
    _iPhoneMenuVisible = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
