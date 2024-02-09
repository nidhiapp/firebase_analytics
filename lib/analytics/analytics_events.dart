import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:poc_firebase_analytics/analytics/analytics_enum.dart';


class AnalyticsEvents {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
 // static final AdjustAnalytics adjustAnalytics = AdjustAnalytics.instance;

// fresh Installation

  static Future<void> logEvent(EventName event, Map<String, dynamic> ?parameters) async {
    await analytics.logEvent(
        name: event.eventName, parameters:parameters);
 // await AdjustEvent.ev
  }
}
