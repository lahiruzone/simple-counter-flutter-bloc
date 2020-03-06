import 'package:bloc/bloc.dart';

enum CounterEvents {Increment, Decrement}

//ConuterBloc - Accept input, int - output
class CounterBloc extends Bloc<CounterEvents, int>{
  @override
  // TODO: implement initialState
  int get initialState => 0; //counter value of initial state

  @override
  Stream<int> mapEventToState(CounterEvents event) async*{
    // TODO: implement mapEventToState
    switch(event){
      case CounterEvents.Increment:
        yield state + 1;
        break;
      case CounterEvents.Decrement:
      yield state - 1;
        break;
    }
  }

} 