import 'package:counter_app/bloc/sliderbloc/bloc/slider_bloc.dart';
import 'package:counter_app/bloc/sliderbloc/bloc/slider_event.dart';
import 'package:counter_app/bloc/sliderbloc/bloc/slider_state.dart';
import 'package:counter_app/bloc/switchexamplebloc/bloc/switch_bloc.dart';
import 'package:counter_app/bloc/switchexamplebloc/bloc/switch_event.dart';
import 'package:counter_app/bloc/switchexamplebloc/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Example'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.withAlpha(111),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
        child: Column(
          spacing: 50,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Notification',
                  style: TextStyle(fontSize: 24, color: Colors.deepPurple),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitched != current.isSwitched,
                  builder: (context, state) {
                    print('switch is building');
                    return Switch(
                      value: state.isSwitched,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                          EnableOrDesableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<SliderBloc, SliderState>(
              builder: (context, state) {
                return Container(
                  height: 300,
                  color: Colors.blueAccent.withOpacity(state.slider),
                );
              },
            ),
            BlocBuilder<SliderBloc, SliderState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print('slider is building');

                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SliderBloc>().add(
                      IsSlidingEvent(slider: value),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
