import 'package:flutter_bloc/flutter_bloc.dart';
import 'currency_event.dart';
import 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial());

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async* {
    if (event is ConvertCurrencyEvent) {
      yield CurrencyLoading();
      try {
        
      } catch (e) {
        
      }
    }
  }
}