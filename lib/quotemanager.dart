import 'dart:math';

class QuoteManager {
  static final List<String> _quotes = [
    "This is your daily inspiring quote!",
    "The only way to do great work is to love what you do.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "Believe you can and you're halfway there.",
    "You are never too old to set another goal or to dream a new dream.",
    '"The only way to do great work is to love what you do." - Steve Jobs',
    '"The best way to predict the future is to create it." - Peter Drucker',
    '"Believe you can and you\'re halfway there." - Theodore Roosevelt',
    '"Success is not the key to happiness. Happiness is the key to success." - Albert Schweitzer',
    '"The only limit to our realization of tomorrow is our doubts of today." - Franklin D. Roosevelt',
    '"In the end, we only regret the chances we didn\'t take." - Lewis Carroll',
    '"You miss 100% of the shots you don\'t take." - Wayne Gretzky',
    '"Don\'t watch the clock; do what it does. Keep going." - Sam Levenson',
    '"The future belongs to those who believe in the beauty of their dreams." - Eleanor Roosevelt',
    '"Hardships often prepare ordinary people for an extraordinary destiny." - C.S. Lewis',
    '"It\'s not whether you get knocked down, it\'s whether you get up." - Vince Lombardi',
    '"Dream big and dare to fail." - Norman Vaughan',
    '"What lies behind us and what lies before us are tiny matters compared to what lies within us." - Ralph Waldo Emerson',
    '"The only impossible journey is the one you never begin." - Tony Robbins',
    '"Act as if what you do makes a difference. It does." - William James',
    '"Life is 10% what happens to us and 90% how we react to it." - Charles R. Swindoll',
    '"Keep your face always toward the sunshine—and shadows will fall behind you." - Walt Whitman',
    '"The only way to achieve the impossible is to believe it is possible." - Charles Kingsleigh (from Alice in Wonderland)'
  ];

  static String getDailyQuote() {
    Random random = Random();
    int index = random.nextInt(_quotes.length);
    return _quotes[index];
  }
}
