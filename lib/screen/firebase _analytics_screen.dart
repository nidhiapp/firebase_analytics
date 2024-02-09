import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:poc_firebase_analytics/analytics/analytics_enum.dart';
import 'package:poc_firebase_analytics/analytics/analytics_events.dart';
import 'package:poc_firebase_analytics/analytics/analytics_screen_enum.dart';
import 'package:poc_firebase_analytics/analytics/firebase_screen_observer.dart';
import 'package:poc_firebase_analytics/screen/initial_page.dart';

class FirebaseAnalyticsScreen extends StatefulWidget {
  FirebaseAnalyticsScreen({Key? key}) : super(key: key);

  @override
  _FirebaseAnalyticsScreenState createState() =>
      _FirebaseAnalyticsScreenState();
}

class _FirebaseAnalyticsScreenState extends State<FirebaseAnalyticsScreen> with RouteAwareAnalytics {
    @override
  // TODO: implement route
  AnalyticsRoute get route => AnalyticsRoute.home;
  @override
  void initState() {
    super.initState();
    // set a user property
    FirebaseAnalytics.instance.setUserProperty(name: "testing", value: "test");
  }

  @override
  void dispose() {
    // Clean up code here
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // add setCurrentScreeninstead of initState because might not always give you the
  //   // expected results because initState() is called before the widget
  //   // is fully initialized, so the screen might not be visible yet.
  //   FirebaseAnalytics.instance.setCurrentScreen(screenName: "Main Screen");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Firebase Analytics',
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  AnalyticsEvents.logEvent(EventName.buttonClick, {});
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InitialPage()));

                  print("button clicked");
                },
                child: Text("Send Analytics!"))
          ],
        ),
      ),
    );
  }
  

}
