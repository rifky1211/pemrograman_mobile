import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexInitial()) {
    on<OnIndex>((event, emit) {
      emit(IndexLoaded(event.index));
    });
    on<OnResetIndex>((event, emit) {
      emit(IndexInitial());
    });
  }
}
