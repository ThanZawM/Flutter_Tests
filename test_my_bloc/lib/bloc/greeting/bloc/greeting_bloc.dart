import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'greeting_event.dart';
part 'greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  static const List<String> greetList = ["Howdy!", "What's up!", "You're Rock!"];

  GreetingBloc() : super(GreetingInitial());

  @override
  Stream<GreetingState> mapEventToState(
    GreetingEvent event,
  ) async* {
    if (event is HowdyEvent) {
      yield GreetingInitial();
      final message = await getData(0);
      print(message);
      yield HowdyState(message);
    }
    if (event is WhatUpEvent) {
      yield GreetingInitial();
      final message = await getData(1);
      yield WhatUpState(message);
    }
    if (event is YouAreRockEvent) {
      yield GreetingInitial();
      final message = await getData(2);
      yield YouAreRockState(message);
    }
  }

  Future<String> getData(int index) async {
    await Future.delayed(Duration(seconds: 1));
    return greetList[index];
  }
}
