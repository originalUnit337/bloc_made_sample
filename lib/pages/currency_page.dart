import 'package:flutter/material.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency page'),
      ),
      body: const Center(
        child: Text('This is the currency page'),
      ),
    );
  }
}
