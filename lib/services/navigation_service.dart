import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateReplace(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  closeScreen() {
    return navigatorKey.currentState!.pop();
  }
}
