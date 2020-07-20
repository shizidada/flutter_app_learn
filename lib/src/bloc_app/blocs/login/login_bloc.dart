import 'package:flutter_app_learn/src/bloc_app/blocs/login/login_event.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginLoadingEvent) {
      yield LoginLoadingState();
      await Future.delayed(Duration(seconds: 2));
      yield LoginSuccessState();
    }
  }
}
