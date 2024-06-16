import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<List<String>> getFavoriteQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favoriteQuotes') ?? [];
  }

  static Future<void> saveQuoteToFavorites(String quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotes = prefs.getStringList('favoriteQuotes') ?? [];
    if (!favoriteQuotes.contains(quote)) {
      favoriteQuotes.add(quote);
      await prefs.setStringList('favoriteQuotes', favoriteQuotes);
    }
  }

  static Future<void> deleteQuoteFromFavorites(String quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotes = prefs.getStringList('favoriteQuotes') ?? [];
    favoriteQuotes.remove(quote);
    await prefs.setStringList('favoriteQuotes', favoriteQuotes);
  }

  static Future<bool> isQuoteFavorite(String quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotes = prefs.getStringList('favoriteQuotes') ?? [];
    return favoriteQuotes.contains(quote);
  }
}
