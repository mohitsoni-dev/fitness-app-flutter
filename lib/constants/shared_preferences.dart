import 'package:shared_preferences/shared_preferences.dart';

const String USER_GOAL = 'user_goal';

addStringToSF({String? tag, String? string}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(tag!, string!);
}

addDoubleToSF({String? tag, double? value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(tag!, value!);
}

addBoolToSF({String? tag, bool? value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(tag!, value!);
}

addIntToSF({String? tag, int? value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(tag!, value!);
}

// getStringValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return String
//   String stringValue = prefs.getString('stringValue');
//   return stringValue;
// }
// getBoolValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return bool
//   bool boolValue = prefs.getBool('boolValue');
//   return boolValue;
// }
// getIntValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return int
//   int intValue = prefs.getInt('intValue');
//   return intValue;
// }
// getDoubleValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return double
//   double doubleValue = prefs.getDouble('doubleValue');
//   return doubleValue;
// }
