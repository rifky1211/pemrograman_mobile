import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputInitial()) {
    on<OnInput>((event, emit) {
      emit(InputLoaded(event.query));
    });
    on<OnResetInput>((event, emit) {
      emit(InputInitial());
    });
  }
}
