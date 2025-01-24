import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';
import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState()) {
    on<ToggleThemeEvent>((event, emit) {
      if (state is LightThemeState || state is ThemeInitialState) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    });
  }
}
