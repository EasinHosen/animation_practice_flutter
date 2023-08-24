import 'package:flutter/material.dart';

import 'example_four_page.dart';

class ExampleFourPage2 extends StatelessWidget {
  const ExampleFourPage2({super.key});
  static const String routeName = '/example_four_page2';

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Person person = arg['argument'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: person.emoji,
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0,
                        end: 1,
                      ).chain(
                          CurveTween(curve: Curves.fastEaseInToSlowEaseOut)),
                    ),
                    child: toHeroContext.widget,
                  ),
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: fromHeroContext.widget,
                );
            }
          },
          child: Text(
            person.emoji,
            style: const TextStyle(fontSize: 50),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Text(
            person.name,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            '${person.age} years old',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
