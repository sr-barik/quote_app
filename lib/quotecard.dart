import 'package:flutter/material.dart';
import 'package:quote_app/quoteviewer.dart';
import 'package:quote_app/sharedprefences.dart';
import 'package:share/share.dart';
// Assuming this is where SharedPreferencesService is defined

class QuoteCard extends StatelessWidget {
  final String quote;

  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  void _shareQuote(BuildContext context) {
    Share.share(
      quote,
      subject: 'Check out this inspiring quote!',
    );
  }

  void _toggleFavorite(BuildContext context) async {
    bool isFavorite = await SharedPreferencesService.isQuoteFavorite(quote);
    if (isFavorite) {
      await SharedPreferencesService.deleteQuoteFromFavorites(quote);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quote removed from favorites!')),
      );
    } else {
      await SharedPreferencesService.saveQuoteToFavorites(quote);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quote added to favorites!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuoteViewer(quote: quote),
                      ),
                    );
                  },
                  child: const Text('View'),
                ),
                const SizedBox(width: 10.0),
                TextButton(
                  onPressed: () => _shareQuote(context),
                  child: const Text('Share'),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Theme.of(context)
                        .primaryColor, // Use primary color for favorite icon
                  ),
                  onPressed: () => _toggleFavorite(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
