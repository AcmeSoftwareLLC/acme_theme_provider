import 'package:shared_preferences/shared_preferences.dart';

const String _lastSelectedThemeNameKey = 'LAST_SELECTED_THEMEs';

class SharedPreferencesUtils {
  Future<void> setThemeName(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastSelectedThemeNameKey, themeName);
  }

  Future<String?> getThemeName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastSelectedThemeNameKey);
  }

  Future<bool> setThemeNames(List<String> themeNames) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('theme_names', themeNames);
  }

  Future<List<String>?> getThemeNames() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('theme_names');
  }


}
