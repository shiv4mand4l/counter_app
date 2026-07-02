// For Stop Watch

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/stopwatchbloc/stop_watch_event.dart';
import 'package:counter_app/bloc/stopwatchbloc/stop_watch_state.dart';

class StopWatchBloc extends Bloc<StopWatchEvent, StopWatchState> {
  Timer? _timer;

  StopWatchBloc() : super(StopWatchState()) {
    on<StartWatch>(_startWatch);
    on<PauseWatch>(_pauseWatch);
  }

  void _startWatch(StartWatch event, Emitter<StopWatchState> emit) {
    if (state.isRunning) return;

    emit(state.copyWith(isRunning: true));

    _timer = Timer.periodic(Duration(seconds: 1), (_) => add(PauseWatch()));
  }

  // aab pause watch sa banaiyhe tab continue hotai

  void _pauseWatch(PauseWatch event, Emitter<StopWatchState> emit) {
    emit(state.copyWith(second: state.second + 1));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
