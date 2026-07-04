import 'package:counter_app/bloc/sliderbloc/bloc/slider_event.dart';
import 'package:counter_app/bloc/sliderbloc/bloc/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<IsSlidingEvent>(_isSlidingEvent);
  }

  void _isSlidingEvent(IsSlidingEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
