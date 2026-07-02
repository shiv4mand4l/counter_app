// for staop watch

import 'package:equatable/equatable.dart';

class StopWatchState extends Equatable {
  final int second;
  final bool isRunning;
  const StopWatchState({this.second = 0, this.isRunning = false});

  StopWatchState copyWith({int? second, bool? isRunning}) {
    return StopWatchState(
      second: second ?? this.second,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  @override
  List<Object?> get props => [second, isRunning];
}
