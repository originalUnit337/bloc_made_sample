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
              TableRow(
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
                    title: Text('1 USD'),
                  ),
                  Text('3.4170'),
                  Text('3.4500'),
                ],
              ),
              TableRow(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/european-union.png'),
                    title: Text('1 EUR'),
                  ),
                  Text('3.5600'),
                  Text('3.6200'),
                ],
              ),
              TableRow(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/russia.png'),
                    title: Text('100 RUB'),
                  ),
                  Text('3.3800'),
                  Text('3.4250'),
                ],
              ),
            ],
          ),
          Container(
            height: 150,
          )
        ],
      ),
    );
  }
}
