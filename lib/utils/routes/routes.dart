
import 'package:flutter/material.dart';
import 'package:poc_firebase_analytics/screen/firebase%20_analytics_screen.dart';
import 'package:poc_firebase_analytics/screen/login_screen.dart';
import 'package:poc_firebase_analytics/utils/routes/routes_name.dart';

class Routes {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginscreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.analyticsScreen:
        return MaterialPageRoute(builder: (context) =>  FirebaseAnalyticsScreen());  
    default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("no route is defined")),
          );
        });
    }
  }
}
