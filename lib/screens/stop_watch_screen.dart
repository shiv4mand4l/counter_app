import 'package:counter_app/bloc/stopwatchbloc/stop_watch_bloc.dart';
import 'package:counter_app/bloc/stopwatchbloc/stop_watch_event.dart';
import 'package:counter_app/bloc/stopwatchbloc/stop_watch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 20,
          children: [
            BlocBuilder<StopWatchBloc, StopWatchState>(
              builder: (context, state) =>
                  Text(state.second.toString(), style: TextStyle(fontSize: 44)),
            ),
            Row(
              mainAxisAlignment: .center,
              spacing: 20,
              children: [
                BlocBuilder<StopWatchBloc, StopWatchState>(
                  builder: (context, state) => ElevatedButton(
                    onPressed: () {
                      context.read<StopWatchBloc>().add(StartWatch());
                    },
                    child: Text(
                      state.second == 0 ? 'Start' : 'Resume',
                      style: TextStyle(fontSize: 16, fontWeight: .bold),
                    ),
                  ),
                ),

                BlocBuilder<StopWatchBloc, StopWatchState>(
                  builder: (context, state) => ElevatedButton(
                    onPressed: state.isRunning
                        ? () {
                            context.read<StopWatchBloc>().add(PauseWatch());
                          }
                        : () => 'Paused',
                    child: Text(
                      'Pause',
                      style: TextStyle(fontSize: 16, fontWeight: .bold),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.read<StopWatchBloc>().add(ResettWatch());
              },
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 16, fontWeight: .bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
