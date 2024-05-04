part of 'input_bloc.dart';

sealed class InputState extends Equatable {
  const InputState();

  @override
  List<Object> get props => [];
}

final class InputInitial extends InputState {}

final class InputLoaded extends InputState {
  final String data;

  const InputLoaded(this.data);

  @override
  List<Object> get props => [data];
}
