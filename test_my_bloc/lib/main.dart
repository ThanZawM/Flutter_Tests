import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_my_bloc/bloc/greeting/bloc/greeting_bloc.dart';
import 'package:test_my_bloc/ui/bloc_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _title = "My BLoC";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GreetingBloc>(
      create: (context) => GreetingBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        home: BlocHome(),
      ),
    );
  }
}
