import 'package:pemrograman_mobile/features/destination/presentation/pages/dashboard.dart';

import 'package:flutter/material.dart';

class AppRoute {
  static const dashboard = '/';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );
      default:
        return _notFoundPage;
    }
  }

  static MaterialPageRoute get _notFoundPage => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        ),
      );
}
