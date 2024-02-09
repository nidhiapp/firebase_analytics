import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOptionsScreen extends StatefulWidget {
  const GameOptionsScreen({super.key});

  @override
  State<GameOptionsScreen> createState() => _GameOptionsScreenState();
}

class _GameOptionsScreenState extends State<GameOptionsScreen> {
  List<bool> isSelected = [false, false, false];
  List<String> sports = ["football", "tennis", "basketball"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "sports",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          ToggleButtons(
              onPressed: (index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[index] = !isSelected[index];
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                  if (isSelected[index]) {
                    FirebaseAnalytics.instance.setUserProperty(
                        name: "favourite_sports", value: sports[index]);
                  } else {
                    FirebaseAnalytics.instance.setUserProperty(
                        name: "favourite_sports", value:null);
                  }
                });
              },
              children:<Widget> [Text("football"),
              Text("basketball"),
              Text("tennis"),],
              isSelected: isSelected)
        ],
      )),
    );
  }
}
