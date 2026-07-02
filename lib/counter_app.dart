import 'package:counter_app/bloc/stopwatchbloc/stop_watch_bloc.dart';
import 'package:counter_app/screens/stop_watch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StopWatchBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: StopWatchScreen(),
      ),
    );
  }
}
