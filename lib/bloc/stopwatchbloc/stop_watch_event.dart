// for stop watch

import 'package:equatable/equatable.dart';

abstract class StopWatchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartWatch extends StopWatchEvent {}

class PauseWatch extends StopWatchEvent {}

class ResettWatch extends StopWatchEvent {}
