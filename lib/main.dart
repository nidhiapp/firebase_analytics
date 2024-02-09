import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poc_firebase_analytics/firebase_options.dart';
import 'package:poc_firebase_analytics/screen/login_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    analytics.setAnalyticsCollectionEnabled(true);
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     navigatorObservers: [
      // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        routeObserver,
        // Add your custom route observer here
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    home: LoginScreen(),
    );
  }
}
