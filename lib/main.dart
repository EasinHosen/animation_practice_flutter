import 'package:animation_practice/pages/example_one_page.dart';
import 'package:animation_practice/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const AnimationOnePage(),
      initialRoute: ExampleOnePage.routeName,
      routes: AppRoute.routes,
    );
  }
}
