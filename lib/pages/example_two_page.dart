import 'dart:math';

import 'package:flutter/material.dart';

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();
    late Offset offset;
    late bool clockWise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0); //moves the pencil to end of the container
        offset = Offset(size.width, size.height); //starting and ending point
        clockWise = false; //should go clockwise or not
        break;

      case CircleSide.right:
        offset = Offset(0,
            size.height); //doesn't need to move pencil, starts from 0 to height
        clockWise = true;
        break;
    }
    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockWise);
    path.close();

    return path;
  }
}

class HalfClipper extends CustomClipper<Path> {
  final CircleSide side;
  const HalfClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ExampleTwoPage extends StatefulWidget {
  const ExampleTwoPage({super.key});
  static const String routeName = '/example_two_page';

  @override
  State<ExampleTwoPage> createState() => _ExampleTwoPageState();
}

class _ExampleTwoPageState extends State<ExampleTwoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _counterCwRotationController;
  late Animation<double> _counterCwRotationAnimation;

  @override
  void initState() {
    _counterCwRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _counterCwRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(
      CurvedAnimation(
        parent: _counterCwRotationController,
        curve: Curves.bounceOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _counterCwRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      _counterCwRotationController
        ..reset()
        ..forward();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation two'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _counterCwRotationAnimation,
              builder: (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateZ(_counterCwRotationAnimation.value),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipPath(
                      clipper: const HalfClipper(side: CircleSide.left),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: const Color(0xff0057b7),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: const HalfClipper(side: CircleSide.right),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: const Color(0xffffd700),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '2',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AnimationTwoPage.routeName);
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
