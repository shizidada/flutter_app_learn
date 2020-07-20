import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginLoadingEvent extends LoginEvent {}

class LoginSuccessEvent extends LoginEvent {}

class LoginFailureEvent extends LoginEvent {}
