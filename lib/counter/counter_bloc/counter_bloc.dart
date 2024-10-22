import 'package:flutter_bloc/flutter_bloc.dart';

sealed class counterEvent {}

final class incrementCounter extends counterEvent {}

class CounterBloc extends Bloc<counterEvent, int> {
  CounterBloc() : super(0) {
    on<incrementCounter>((event, emit) {
      emit(state + 1);
    });
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
