import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/counterbloc/counter_event.dart';
import 'package:counter_app/bloc/counterbloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<Reset>(_reset);
  }
  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void _reset(Reset event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter * 0));
  }
}
