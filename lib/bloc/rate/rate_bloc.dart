import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/rate_repository.dart';
import '/models/rate.dart';

abstract class RateEvent {}

class FetchRateEvent extends RateEvent {
  final int? curId;

  FetchRateEvent({this.curId});
}

abstract class RateState {}

class RateInitial extends RateState {}

class RateLoading extends RateState {}

class RateLoaded extends RateState {
  final Rate? rate;
  final Map<String, Rate>? rateMap;

  RateLoaded({this.rate, this.rateMap});
}

class RateError extends RateState {
  final String message;

  RateError(this.message);
}

class RateBloc extends Bloc<RateEvent, RateState> {
  final RateRepository rateRepository;

  RateBloc(this.rateRepository) : super(RateInitial()) {
    on<FetchRateEvent>((event, emit) async {
      try {
        emit(RateLoading());
        //final connectivityResult = await Connectivity().checkConnectivity();

        // if (connectivityResult.contains(ConnectivityResult.ethernet) ||
        //     connectivityResult.contains(ConnectivityResult.wifi) ||
        //     connectivityResult.contains(ConnectivityResult.mobile)) {
        //   final rate = await rateRepository.fetchRate(curId: event.curId).timeout(const Duration(seconds: 30));
        //   emit(RateLoaded(rate));
        // } else {
        //   emit(RateError(
        //       'No internet connection available. Please check your network settings.'));
        // }
        if (event.curId == null) {
          final Map<String, Rate> rateMap = await rateRepository
              .fetchRate()
              .timeout(const Duration(seconds: 30));
          emit(RateLoaded(rateMap: rateMap));
        } else {
          final Rate rate = await rateRepository
              .fetchRate(curId: event.curId)
              .timeout(const Duration(seconds: 30));
          emit(RateLoaded(rate: rate));
        }
      } on Exception catch (e) {
        emit(RateError(e.toString()));
      }
    });
  }

  // @override
  // Stream<RateState> mapEventToState(RateEvent event) async* {
  //   if (event is FetchRateEvent) {
  //     yield RateLoading();
  //     try {
  //       final rate = await rateRepository.fetchRate(curId: event.curId);
  //       yield RateLoaded(rate!);
  //     } catch (error) {
  //       yield RateError('Error fetching rate: $error');
  //     }
  //   }
  // }
}
