import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/303/lottie_learn.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/') {
      _navigateToNormal(const LottieLenar());
    }
    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
