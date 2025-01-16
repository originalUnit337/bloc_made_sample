import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // final bool isDarkMode;
  // final ValueChanged<bool> onThemeChanged;
  //const HomePage({super.key, required this.isDarkMode, required this.onThemeChanged});
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 2;
  final List<String> _titles = [
    'Payments',
    'History',
    'Home',
    'Chats',
    'Profile',
  ];
  bool _isDarkMode = false;
  // final List<Icon> _icons = [
  //   const Icon(Icons.light_mode),
  //   const Icon(Icons.dark_mode),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentPageIndex]),
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {}
            // icon: widget.isDarkMode ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
            // onPressed: () {
            //   widget.onThemeChanged(!widget.isDarkMode);
            // },
          ),
        ],
      ),
      body: [
        SingleChildScrollView(
          child: Column(
            children: [
              Text('Regular payments'),
              Row(
                children: [
                  Text('Card payments'),
                  Text('PayPal'),
                  Text('Apple Pay'),
                  Text('Google Pay'),
                ],
              ),
            ],
          ),
        ),
        Center(),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ratePage');
            },
            child: const Text('Get Currency Rate'),
          ),
        ),
        Center(),
        Center(),
      ][_currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) => setState(() {
          _currentPageIndex = index;
        }),
        selectedIndex: _currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.payment),
            icon: Icon(Icons.payment_outlined),
            label: 'Payments',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.access_time),
            icon: Icon(Icons.access_time_outlined),
            label: 'History',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.wechat),
            icon: Icon(Icons.wechat_outlined),
            label: 'Chats',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
