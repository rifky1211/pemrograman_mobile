import 'package:get_it/get_it.dart';
import 'package:pemrograman_mobile/features/destination/presentation/bloc/input/input_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  // bloc
  locator.registerFactory(() => InputBloc());
}
