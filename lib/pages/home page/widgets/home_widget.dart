import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double paddingAll = 16;
    return Padding(
      padding: const EdgeInsets.all(paddingAll),
      child: Column(
        children: [
          Table(
            children: [
              const TableRow(
                children: [
                  Text('Currency'),
                  Text('Buy'),
                  Text('Sell'),
                ],
              ),
              TableRow(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/united-states.png'),
                    title: const Text('1 USD'),
                  ),
                  const Text('3.4170'),
                  const Text('3.4500'),
                ],
              ),
              TableRow(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/european-union.png'),
                    title: const Text('1 EUR'),
                  ),
                  const Text('3.5600'),
                  const Text('3.6200'),
                ],
              ),
              TableRow(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/russia.png'),
                    title: const Text('100 RUB'),
                  ),
                  const Text('3.3800'),
                  const Text('3.4250'),
                ],
              ),
            ],
          ),
          Container(
            height: 150,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ratePage');
              },
              child: const Text('Get Currency Rate'),
            ),
          ),
        ],
      ),
    );
  }
}
