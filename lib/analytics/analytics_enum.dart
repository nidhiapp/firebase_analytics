import 'package:poc_firebase_analytics/analytics/analytics_parameter.dart';

enum EventName {
  buttonClick(eventName: "Button_click",),
  loginEvent(eventName: "log_in",),
  addDevice(eventName: "event_add_device",),
  errOccured( eventName: "errr_occurred",),
  onnboardingnext(eventName: "event_onboarding_next", ),
  screenView(eventName: "scr_view"),
  onboardingSkip(eventName: "event_onboarding_skip",),
  homeSearch(eventName: "event_home_search",),
  homeExplore(eventName: "event_home_explore",),
  homeExpand(eventName: "event_home_expand",);
     
     


  const EventName({required this.eventName,});
  
  final String eventName;

}
