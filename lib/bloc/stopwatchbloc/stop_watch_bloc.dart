// For Stop Watch

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/stopwatchbloc/stop_watch_event.dart';
import 'package:counter_app/bloc/stopwatchbloc/stop_watch_state.dart';

class StopWatchBloc extends Bloc<StopWatchEvent, StopWatchState> {
  Timer? _timer;

  StopWatchBloc() : super(StopWatchState()) {
    on<StartWatch>(_startWatch);
    on<TickWatch>(_tickWatch);
    on<PauseWatch>(_pauseWatch);
    on<ResettWatch>(_resetWatch);
  }

  // This is for Start
  void _startWatch(StartWatch event, Emitter<StopWatchState> emit) {
    if (state.isRunning) return;

    _timer?.cancel();
    emit(state.copyWith(isRunning: true));

    _timer = Timer.periodic(
      Duration(milliseconds: 100),
      (_) => add(TickWatch()),
    );
  }

  // This is for Tick
  void _tickWatch(TickWatch event, Emitter<StopWatchState> emit) {
    emit(state.copyWith(second: state.second + 1));
  }

  // This is for Pause
  void _pauseWatch(PauseWatch event, Emitter<StopWatchState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  // This is for Reset
  void _resetWatch(ResettWatch event, Emitter<StopWatchState> emit) {
    _timer?.cancel();
    emit(StopWatchState());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
