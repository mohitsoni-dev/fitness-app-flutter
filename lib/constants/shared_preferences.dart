import 'package:shared_preferences/shared_preferences.dart';

const String USER_ID = 'user_id';
const String USER_GOAL = 'user_goal';
const String USER_DIET = 'user_diet';
const String USER_NAME = 'user_name';
const String IS_USER_LOGGED = 'is_user_logged';
const String USER_WEIGHT = 'user_weight';
const String USER_HEIGHT = 'user_height';
const String USER_AGE = 'user_age';
const String USER_LAST_DATE='user_last_date';
const String USER_STREAK='user_streak';

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

Future<String> getStringValuesSF(String? tag) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString(tag!) ?? '';
  return stringValue;
}

getBoolValuesSF(String? tag) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool boolValue = prefs.getBool(tag!) ?? false;
  return boolValue;
}

// getIntValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return int
//   int intValue = prefs.getInt('intValue');
//   return intValue;
// }
getDoubleValuesSF(String? tag) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  double stringValue = prefs.getDouble(tag!) ?? 0.0;
  return stringValue;
}
