part of 'greeting_bloc.dart';

abstract class GreetingEvent extends Equatable {
  const GreetingEvent();

  @override
  List<Object> get props => [];
}


class HowdyEvent extends GreetingEvent {}

class WhatUpEvent extends GreetingEvent {}

class YouAreRockEvent extends GreetingEvent {}