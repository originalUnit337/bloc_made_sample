import 'package:bloc_made_sample/bloc/theme/theme_bloc.dart';
import 'package:bloc_made_sample/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/rate/rate_bloc.dart';
import 'navigation/navigation.dart';
import 'pages/home page/home_page.dart';
import 'repositories/rate_repository.dart';
import 'themes/appTheme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: switch (state) {
            ThemeInitialState() => ThemeMode.system,
            LightThemeState() => ThemeMode.light,
            DarkThemeState() => ThemeMode.dark,
            // TODO: Handle this case.
            ThemeState() => throw UnimplementedError(),
          },
          // state is LightThemeState ? ThemeMode.light : ThemeMode.dark,
          initialRoute: '/',
          onGenerateRoute: AppNavigator.generateRoute,
          home: BlocProvider(
            create: (context) => RateBloc(RateRepository()),
            child: const HomePage(
                // isDarkMode: _isDarkMode,
                // onThemeChanged: (value) => _isDarkMode = value,
                ),
          ),
        );
      }),
    );
  }
}
