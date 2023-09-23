import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferenceHelper {
  static const String Count = "counter";
  static const String isActive = "isActive";

  final SharedPreferences prefs;


  SharedPreferenceHelper({required this.prefs});


  //setter
  Future<void> setCount({required int count}) async {
    await prefs.setInt(Count, count);
  }

  Future<void> setActive({required bool active}) async {
    await prefs.setBool(isActive, active);
  }

  //getter

  int? getCount() {
    final count = prefs.getInt(Count);
    return count;
  }

  bool? getActive() {
    final active = prefs.getBool(isActive);
    return active;
  }

}