import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitched;

  const SwitchState({this.isSwitched = false});

  SwitchState copyWith({bool? isSwitched}) {
    return SwitchState(isSwitched: isSwitched ?? this.isSwitched);
  }

  @override
  List<Object?> get props => [isSwitched];
}
