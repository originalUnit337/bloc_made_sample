import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/rate/rate_bloc.dart';
import 'navigation/navigation.dart';
import 'pages/home_page.dart';
import 'repositories/rate_repository.dart';

void main() async {
  //final ogo = await RateRepository().getAlfaOnlineBuyUSD();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      //themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // home: BlocProvider(
      //   create: (context) => CounterBloc(),
      //   child: const CounterPage(),
      // ),
      initialRoute: '/',
      onGenerateRoute: AppNavigator.generateRoute,
      home: BlocProvider(
        create: (context) => RateBloc(RateRepository()),
        child: HomePage(
          // isDarkMode: _isDarkMode,
          // onThemeChanged: (value) => _isDarkMode = value,
        ),
      ),
    );
  }
}
