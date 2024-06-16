import 'package:flutter/material.dart';
import 'package:quote_app/fav_quote.dart';

import 'package:quote_app/quotecard.dart';
import 'package:quote_app/quotemanager.dart'; // Assuming this is where FavoriteQuotesScreen is defined

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> quotes = [
      QuoteManager.getDailyQuote(),
      QuoteManager.getDailyQuote(),
      QuoteManager.getDailyQuote(),
      QuoteManager.getDailyQuote(),
      QuoteManager.getDailyQuote(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Inspiring Quotes'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteQuotesScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return QuoteCard(
            quote: quotes[index],
          );
        },
      ),
    );
  }
}
