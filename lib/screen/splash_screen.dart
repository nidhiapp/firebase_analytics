import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:poc_firebase_analytics/analytics/analytics_enum.dart';
import 'package:poc_firebase_analytics/analytics/analytics_events.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  void initState() {
    analytics.setAnalyticsCollectionEnabled(true);
    super.initState();

    bool apiSuccess = true;
    if (apiSuccess) {
      AnalyticsEvents.logEvent(EventName.addDevice,{});
      //_logEvent(AnalyticsEventsNames.eventAddDevice);
    }
    // AnalyticsEvents.errOccuredEvent(AnalyticsEventsNames.errOccured,
    //     "error_code", "error_category", "error_description");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
