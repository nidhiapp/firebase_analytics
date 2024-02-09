


import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:poc_firebase_analytics/analytics/analytics_screen_enum.dart';

// A Navigator observer that notifies RouteAwares of changes to state of their Route
final routeObserver = RouteObserver<PageRoute>();

mixin RouteAwareAnalytics<T extends StatefulWidget> on State<T>
    implements RouteAware {
  AnalyticsRoute get route;
   @override
 void didChangeDependencies() {
   super.didChangeDependencies();
   routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
 }



  

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {}

  @override
  void didPopNext() {
    // Called when the top route has been popped off,
    // and the current route shows up.
    _setCurrentScreen(route);
  }

  @override
  void didPush() {
    // Called when the current route has been pushed.
    _setCurrentScreen(route);
  }

  @override
  void didPushNext() {}

  Future<void> _setCurrentScreen(AnalyticsRoute analyticsRoute) {
    print('Setting current screen to $analyticsRoute');
    return FirebaseAnalytics.instance.setCurrentScreen(
      screenName: screenName(analyticsRoute),
      screenClassOverride: screenClass(analyticsRoute),
    );
  }
}