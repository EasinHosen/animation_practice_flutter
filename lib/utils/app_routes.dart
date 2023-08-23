import 'package:animation_practice/pages/example_one_page.dart';
import 'package:flutter/material.dart';

import '../pages/example_two_page.dart';

class AppRoute {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    ExampleOnePage.routeName: (context) => const ExampleOnePage(),
    ExampleTwoPage.routeName: (context) => const ExampleTwoPage(),
  };
}
