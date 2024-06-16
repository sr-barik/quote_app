import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteViewer extends StatelessWidget {
  final String quote;

  QuoteViewer({required this.quote});

  void _shareQuote(BuildContext context) {
    Share.share(
      quote,
      subject: 'Check out this inspiring quote!',
    );
  }

  void _saveQuote(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotes = prefs.getStringList('favoriteQuotes') ?? [];
    if (!favoriteQuotes.contains(quote)) {
      favoriteQuotes.add(quote);
      await prefs.setStringList('favoriteQuotes', favoriteQuotes);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quote saved to favorites!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quote already saved!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Viewer'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quote,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _shareQuote(context),
                child: const Text('Share'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveQuote(context),
                child: const Text('Save to Favorites'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
