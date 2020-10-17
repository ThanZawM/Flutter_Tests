part of 'greeting_bloc.dart';

abstract class GreetingState extends Equatable {
  const GreetingState();

  @override
  List<Object> get props => [];
}

class GreetingInitial extends GreetingState {}

class HowdyState extends GreetingState {
  final String greeting;
  HowdyState(this.greeting);
}

class WhatUpState extends GreetingState {
  final String greeting;
  WhatUpState(this.greeting);
}

class YouAreRockState extends GreetingState {
  final String greeting;
  YouAreRockState(this.greeting);
}

class ErrorState extends GreetingState {}
