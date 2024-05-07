part of 'index_bloc.dart';

sealed class IndexState extends Equatable {
  const IndexState();

  @override
  List<Object> get props => [];
}

final class IndexInitial extends IndexState {}

final class IndexLoaded extends IndexState {
  final int data;

  const IndexLoaded(this.data);

  @override
  List<Object> get props => [data];
}
