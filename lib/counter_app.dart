import 'package:counter_app/bloc/sliderbloc/bloc/slider_bloc.dart';
import 'package:counter_app/bloc/switchexamplebloc/bloc/switch_bloc.dart';
import 'package:counter_app/ui/switch_exapmle_screen/switch_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => CounterBloc()),
        // BlocProvider(create: (_) => StopWatchBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => SliderBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SwitchExampleScreen(),
      ),
    );
  }
}
