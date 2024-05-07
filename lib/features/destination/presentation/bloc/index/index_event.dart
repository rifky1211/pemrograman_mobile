part of 'index_bloc.dart';

sealed class IndexEvent extends Equatable {
  const IndexEvent();

  @override
  List<Object> get props => [];
}

class OnIndex extends IndexEvent {
  final int index;

  const OnIndex(this.index);

  @override
  List<Object> get props => [index];
}

class OnResetIndex extends IndexEvent {}
