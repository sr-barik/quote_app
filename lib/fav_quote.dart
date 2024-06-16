import 'package:flutter/material.dart';
import 'package:quote_app/sharedprefences.dart';

// Assuming you have defined SharedPreferencesService

class FavoriteQuotesScreen extends StatefulWidget {
  const FavoriteQuotesScreen({super.key});

  @override
  _FavoriteQuotesScreenState createState() => _FavoriteQuotesScreenState();
}

class _FavoriteQuotesScreenState extends State<FavoriteQuotesScreen> {
  List<String> favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteQuotes();
  }

  void _loadFavoriteQuotes() async {
    List<String> quotes = await SharedPreferencesService.getFavoriteQuotes();
    setState(() {
      favoriteQuotes = quotes;
    });
  }

  void _deleteQuote(int index) async {
    String quoteToDelete = favoriteQuotes[index];
    await SharedPreferencesService.deleteQuoteFromFavorites(quoteToDelete);
    setState(() {
      favoriteQuotes.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quote deleted from favorites!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Quotes'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: favoriteQuotes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteQuotes[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteQuote(index),
            ),
          );
        },
      ),
    );
  }
}
