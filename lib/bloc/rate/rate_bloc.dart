import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/rate_repository.dart';
import '/models/rate.dart';

abstract class RateEvent {}

class FetchRateEvent extends RateEvent {
  final int curId;

  FetchRateEvent(this.curId);
}

abstract class RateState {}

class RateInitial extends RateState {}

class RateLoading extends RateState {}

class RateLoaded extends RateState {
  final Rate rate;

  RateLoaded(this.rate);
}

class RateError extends RateState {
  final String message;

  RateError(this.message);
}

class RateBloc extends Bloc<RateEvent, RateState> {
  final RateRepository rateRepository;

  RateBloc(this.rateRepository) : super(RateInitial()) {
    on<FetchRateEvent>((event, emit) async {
      emit(RateLoading());
      final rate = await rateRepository.fetchRate(curId: event.curId);
      emit(RateLoaded(rate));
    });
  }

  @override
  Stream<RateState> mapEventToState(RateEvent event) async* {
    if (event is FetchRateEvent) {
      yield RateLoading();
      try {
        final rate = await rateRepository.fetchRate(curId: event.curId);
        yield RateLoaded(rate!);
      } catch (error) {
        yield RateError('Error fetching rate: $error');
      }
    }
  }
}
