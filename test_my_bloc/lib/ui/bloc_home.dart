import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_my_bloc/bloc/greeting/bloc/greeting_bloc.dart';

class BlocHome extends StatefulWidget {
  @override
  _BlocHomeState createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple BLoC'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DisplayWidget(),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            BlocProvider.of<GreetingBloc>(context)
                              ..add(HowdyEvent());
                          },
                          child: Text(
                            'Howdy!',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Container(
                      child: FlatButton(
                          color: Colors.green,
                          onPressed: () {BlocProvider.of<GreetingBloc>(context)
                              ..add(WhatUpEvent());},
                          child: Text(
                            "What's up!",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Container(
                      child: FlatButton(
                          color: Colors.orange,
                          onPressed: () {BlocProvider.of<GreetingBloc>(context)
                              ..add(YouAreRockEvent());},
                          child: Text(
                            "You're Rock!",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreetingBloc, GreetingState>(builder: (context, state) {
      String _greet = "Loading...";
      if (state is GreetingInitial) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(),
        );
      }
      if (state is HowdyState) {
        _greet = state.greeting;
      }
      if (state is WhatUpState) {
        _greet = state.greeting;
      }
      if (state is YouAreRockState) {
        _greet = state.greeting;
      }
      return Container(
        child: Text(
          '$_greet',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
        ),
      );
    });
  }
}
