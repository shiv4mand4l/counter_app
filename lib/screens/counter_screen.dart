import 'package:counter_app/bloc/counterbloc/counter_bloc.dart';
import 'package:counter_app/bloc/counterbloc/counter_event.dart';
import 'package:counter_app/bloc/counterbloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 20,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 44),
              ),
            ),
            Row(
              mainAxisAlignment: .center,
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 16, fontWeight: .bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(fontSize: 16, fontWeight: .bold),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(Reset());
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
