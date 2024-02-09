enum AnalyticsRoute { example, home }

String screenClass(AnalyticsRoute route) {
  switch (route) {
    case AnalyticsRoute.example:
      return 'ExampleRoute';
    // Add a default case to handle any other enum values

    case AnalyticsRoute.home:
      return 'HomeRoute';
    default:
      throw ArgumentError.value(route, 'route', 'Unknown AnalyticsRoute value');
  }
}

String screenName(AnalyticsRoute route) {
  switch (route) {
    case AnalyticsRoute.example:
      return '/example';
    case AnalyticsRoute.home:
      return '/home';
    // Add a default case to handle any other enum values
    default:
      throw ArgumentError.value(route, 'route', 'Unknown AnalyticsRoute value');
  }
}
