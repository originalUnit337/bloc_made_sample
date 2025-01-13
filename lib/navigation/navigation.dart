import 'package:bloc_made_sample/pages/counter_page.dart';
import 'package:flutter/material.dart';

import '../pages/currency_page.dart';
import '../pages/home_page.dart';
import '../pages/rate_page.dart';

class AppNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/currencies':
        return MaterialPageRoute(builder: (context) => const CurrencyPage());
      case '/ratePage':
        return MaterialPageRoute(builder: (context) => const RatePage());
      default:
        return MaterialPageRoute(builder: (context) => const CounterPage());
    }
  }
}