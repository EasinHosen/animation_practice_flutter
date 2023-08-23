import 'dart:math';

import 'package:animation_practice/pages/example_two_page.dart';
import 'package:flutter/material.dart';

class ExampleOnePage extends StatefulWidget {
  const ExampleOnePage({Key? key}) : super(key: key);
  static const String routeName = '/example_one_page';

  @override
  State<ExampleOnePage> createState() => _ExampleOnePageState();
}

class _ExampleOnePageState extends State<ExampleOnePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation one'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(_animation.value),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ExampleTwoPage.routeName);
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
