// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class SessionManager {
  final Storage localStorage;

  SessionManager._(this.localStorage);

  static SessionManager _instance;

  static SessionManager getInstance(){
    if (_instance == null) {
      _instance = SessionManager._(window.localStorage);
    }
    return _instance;
  }

  Future saveData(String key,String value) async {
    localStorage[key] = value;
  }

  Future<String> getData(String key) async => localStorage[key];

  Future removeData(String key) async {
    localStorage.remove(key);
  }
}