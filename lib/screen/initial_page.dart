import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:poc_firebase_analytics/screen/bussiness_page.dart';
import 'package:poc_firebase_analytics/screen/home_page.dart';
import 'package:poc_firebase_analytics/screen/profile_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  int selectedIndex = 0;

  // Instantiate your pages once
  static List pageNames = ["homepage", "businesspage", "profilepage"];
  static const List<Widget> widgetoptions = [
    HomePage(),
    Busineespage(),
    Profilepage()
  ];

  @override
  void initState() {
    analytics.setAnalyticsCollectionEnabled(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetoptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: "Business"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: (index) async {
          await analytics.logEvent(name: 'pages_tracked', 
          parameters: {"page_name":pageNames[index],
          "page_index":index
          });
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
