import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, '/ratePage');
        },
        child: const Text('Get Currency Rate'),
       ),
      ),
    );
  }
}