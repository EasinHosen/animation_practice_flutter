import 'package:animation_practice/pages/example_eight_page.dart';
import 'package:animation_practice/pages/example_five_page.dart';
import 'package:animation_practice/pages/example_four_page2.dart';
import 'package:animation_practice/pages/example_seven_page.dart';
import 'package:animation_practice/pages/example_six_page.dart';
import 'package:animation_practice/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../pages/example_four_page.dart';
import '../pages/example_one_page.dart';
import '../pages/example_three_page.dart';
import '../pages/example_two_page.dart';

class AppRoute {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    HomePage.routeName: (context) => const HomePage(),
    ExampleOnePage.routeName: (context) => const ExampleOnePage(),
    ExampleTwoPage.routeName: (context) => const ExampleTwoPage(),
    ExampleThreePage.routeName: (context) => const ExampleThreePage(),
    ExampleFourPage.routeName: (context) => const ExampleFourPage(),
    ExampleFourPage2.routeName: (context) => const ExampleFourPage2(),
    ExampleFivePage.routeName: (context) => const ExampleFivePage(),
    ExampleSixPage.routeName: (context) => const ExampleSixPage(),
    ExampleSevenPage.routeName: (context) => const ExampleSevenPage(),
    ExampleEightPage.routeName: (context) => const ExampleEightPage(),
  };
}
