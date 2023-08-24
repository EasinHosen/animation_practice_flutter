import 'package:animation_practice/pages/example_four_page2.dart';
import 'package:flutter/material.dart';

import '../pages/example_four_page.dart';
import '../pages/example_one_page.dart';
import '../pages/example_three_page.dart';
import '../pages/example_two_page.dart';

class AppRoute {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    ExampleOnePage.routeName: (context) => const ExampleOnePage(),
    ExampleTwoPage.routeName: (context) => const ExampleTwoPage(),
    ExampleThreePage.routeName: (context) => const ExampleThreePage(),
    ExampleFourPage.routeName: (context) => const ExampleFourPage(),
    ExampleFourPage2.routeName: (context) => const ExampleFourPage2(),
  };
}
