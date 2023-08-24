import 'dart:math';

import 'package:flutter/material.dart';

class ExampleThreePage extends StatefulWidget {
  const ExampleThreePage({super.key});
  static const String routeName = '/example_three_page';

  @override
  State<ExampleThreePage> createState() => _ExampleThreePageState();
}

class _ExampleThreePageState extends State<ExampleThreePage>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  late Tween<double> _animation;

  @override
  void initState() {
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
    super.initState();
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();
    _yController
      ..reset()
      ..repeat();
    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation three'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([
                _xController,
                _yController,
                _zController,
              ]),
              builder: (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(_animation.evaluate(_xController))
                  ..rotateY(_animation.evaluate(_yController))
                  ..rotateZ(_animation.evaluate(_zController)),
                child: Stack(
                  children: [
                    //front
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.translationValues(0, 0, -100.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.purple,
                        child: const Center(
                          child: Text(
                            'Back',
                            // style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    //left
                    Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()..rotateY(pi / 2),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Left',
                            // style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    //right
                    Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()..rotateY(-pi / 2),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'Right',
                            // style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    //back
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          'Front',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    //top
                    Transform(
                      alignment: Alignment.topCenter,
                      transform: Matrix4.identity()..rotateX(-pi / 2),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.orange,
                        child: const Center(
                          child: Text(
                            'Top',
                            // style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    //bottom
                    Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()..rotateX(pi / 2),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.pinkAccent,
                        child: const Center(
                          child: Text(
                            'Bottom',
                            // style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, ExampleThreePage.routeName);
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
