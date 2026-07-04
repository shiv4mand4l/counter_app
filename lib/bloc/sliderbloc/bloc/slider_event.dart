abstract class SliderEvent {
  SliderEvent();

  List<Object> get props => [];
}

class IsSlidingEvent extends SliderEvent {
  double slider;
  IsSlidingEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
