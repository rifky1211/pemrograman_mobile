import 'package:pemrograman_mobile/features/destination/presentation/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemrograman_mobile/features/destination/presentation/pages/profile_page.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(0);

  change(int i) => emit(i);

  final List menuDashboard = [
    ['Home', Icons.home, const HomePage()],
    ['Near', Icons.near_me, const Center(child: Text('Near'))],
    ['Favorite', Icons.favorite, const Center(child: Text('Favorite'))],
    ['Profile', Icons.person, const Profile()],
  ];

  Widget get page => menuDashboard[state][2];
}
