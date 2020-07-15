import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/blocs/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum HomeEvent { increment, decrement }

class HomeBloc extends Bloc<HomeEvent, int> {
  DetailBloc detailBloc;

  HomeBloc({
    @required this.detailBloc,
  })  : assert(detailBloc != null),
        super(0);

  @override
  Stream<int> mapEventToState(HomeEvent event) async* {
    switch (event) {
      case HomeEvent.decrement:
        detailBloc.add(DetailEvent.decrement);
        yield state - 1;
        break;
      case HomeEvent.increment:
        yield state + 1;
        detailBloc.add(DetailEvent.increment);
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}
