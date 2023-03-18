import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return null;
    }
  }
}
