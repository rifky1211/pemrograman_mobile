part of 'input_bloc.dart';

sealed class InputEvent extends Equatable {
  const InputEvent();

  @override
  List<Object> get props => [];
}

class OnInput extends InputEvent {
  final String query;

  const OnInput(this.query);

  @override
  List<Object> get props => [query];
}

class OnResetInput extends InputEvent {}
