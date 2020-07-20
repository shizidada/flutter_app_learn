import 'package:flutter_bloc/flutter_bloc.dart';

enum DetailEvent { increment, decrement }

class DetailBloc extends Bloc<DetailEvent, int> {
  DetailBloc() : super(100000);

  @override
  Stream<int> mapEventToState(DetailEvent event) async* {
    switch (event) {
      case DetailEvent.decrement:
        yield state - 1;
        break;
      case DetailEvent.increment:
        yield state + 1;
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}
