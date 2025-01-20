import 'package:bloc_made_sample/bloc/theme/theme_event.dart';
import 'package:bloc_made_sample/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/theme_bloc.dart';

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
  final bool _isDarkMode = false;
  // final List<Icon> _icons = [
  //   const Icon(Icons.light_mode),
  //   const Icon(Icons.dark_mode),
  // ];
  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentPageIndex]),
        actions: [
          BlocProvider(
            create: (context) => ThemeBloc(),
            child:
                BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
              if (state is LightThemeState) {
                return IconButton(
                    icon: const Icon(Icons.dark_mode),
                    onPressed: () {
                      context2.read<ThemeBloc>().add(ToggleThemeEvent());
                      context.read<ThemeBloc>().add(ToggleThemeEvent());
                    }
                    // icon: widget.isDarkMode ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
                    // onPressed: () {
                    // c  widget.onThemeChanged(!widget.isDarkMode);
                    // },
                    );
              } else if (state is DarkThemeState) {
                return IconButton(
                    icon: const Icon(Icons.light_mode),
                    onPressed: () {
                      context2.read<ThemeBloc>().add(ToggleThemeEvent());
                      context.read<ThemeBloc>().add(ToggleThemeEvent());
                    });
              } else
                return Center();
            }),
          ),
          // IconButton(
          //     icon: context.read<ThemeBloc>().state is LightThemeState
          //         ? const Icon(Icons.light_mode)
          //         : const Icon(Icons.dark_mode),
          //     onPressed: () =>
          //         context.read<ThemeBloc>().add(ToggleThemeEvent()))
        ],
      ),
      body: [
        const SingleChildScrollView(
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
        const Center(),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ratePage');
            },
            child: const Text('Get Currency Rate'),
          ),
        ),
        const Center(),
        const Center(),
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
