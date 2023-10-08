import 'package:shared_preferences/shared_preferences.dart';

class IndexedDB {
  static void setLoginStatus(bool val) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setBool("isLogin", val);
  }

  static Future<bool> getLoginStatus() async{
     SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool("isLogin")??false;

  }
  static void setToken(String val) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("token", val);
  }

  static Future<String> getToken() async{
     SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString("token")??"";

  }

   static void setEmail(String val) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("email", val);
  }

  static Future<String> getEmail() async{
     SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString("email")??"";

  }
}
