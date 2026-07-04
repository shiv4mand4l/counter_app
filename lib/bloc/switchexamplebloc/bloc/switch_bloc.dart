import 'package:counter_app/bloc/switchexamplebloc/bloc/switch_event.dart';
import 'package:counter_app/bloc/switchexamplebloc/bloc/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDesableNotification>(_enableOrDesableNotification);
  }

  void _enableOrDesableNotification(
    EnableOrDesableNotification event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitched: !state.isSwitched));
  }
}
