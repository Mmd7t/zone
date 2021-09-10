import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class SharedPrefsHelper {
  static SharedPreferences prefs;

/*-----------------------------------  Initialize Prefs  -----------------------------------*/
  static initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

/*-------------------------------------  save Api key  -------------------------------------*/
  static void saveApiKeyToPrefs(apiToken) async {
    await initPrefs();
    prefs.setString(Constants.apiKey, apiToken);
  }

/*-------------------------------------  get Api key  --------------------------------------*/
  static Future<String> getApiTokenFromPrefs() async {
    await initPrefs();
    String apiTokenSaved = prefs.getString(Constants.apiKey);
    return apiTokenSaved;
  }

/*-------------------------------------  remove Api key  --------------------------------------*/

  static Future removeToken() async {
    await initPrefs();
    prefs.remove(Constants.apiKey);
  }

/*-------------------------------------  save userId  -------------------------------------*/
  static void saveUserIdToPrefs(userid) async {
    await initPrefs();
    prefs.setInt(Constants.userId, userid);
  }

/*-------------------------------------  get userId  --------------------------------------*/
  static Future<int> getUserIdFromPrefs() async {
    await initPrefs();
    int userIdSaved = prefs.getInt(Constants.userId);
    return userIdSaved;
  } /*-------------------------------------  remove userId  --------------------------------------*/

  static Future removeUserId() async {
    await initPrefs();
    prefs.remove(Constants.userId);
  }
}
