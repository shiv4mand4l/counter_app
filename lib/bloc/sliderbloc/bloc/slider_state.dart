import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double slider;

  const SliderState({this.slider = 0.5});

  SliderState copyWith({double? slider}) {
    return SliderState(slider: slider ?? this.slider);
  }

  @override
  List<Object?> get props => [slider];
}
