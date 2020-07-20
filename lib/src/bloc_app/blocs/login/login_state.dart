import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {}
