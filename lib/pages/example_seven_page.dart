import 'dart:math';

import 'package:flutter/material.dart';

class ExampleSevenPage extends StatefulWidget {
  const ExampleSevenPage({super.key});
  static const String routeName = '/example_seven_page';

  @override
  State<ExampleSevenPage> createState() => _ExampleSevenPageState();
}

class _ExampleSevenPageState extends State<ExampleSevenPage>
    with TickerProviderStateMixin {
  late AnimationController _sidesController;
  late Animation<int> _sidesAnimation;

  late AnimationController _radiusController;
  late Animation<double> _radiusAnimation;

  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    _sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _sidesAnimation = IntTween(
      begin: 3,
      end: 10,
    ).animate(_sidesController);

    _radiusAnimation = Tween<double>(
      begin: 20,
      end: 400,
    )
        .chain(CurveTween(
          curve: Curves.bounceInOut,
        ))
        .animate(_radiusController);

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    )
        .chain(CurveTween(
          curve: Curves.easeInOut,
        ))
        .animate(_rotationController);
    super.initState();
  }

  @override
  void dispose() {
    _sidesController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _sidesController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Seven'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: Listenable.merge([
                  _sidesController,
                  _radiusController,
                  _rotationController,
                ]),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateX(_rotationAnimation.value)
                      ..rotateY(_rotationAnimation.value)
                      ..rotateZ(_rotationAnimation.value),
                    child: CustomPaint(
                      painter: PolygonPainter(sides: _sidesAnimation.value),
                      child: SizedBox(
                        width: _radiusAnimation.value,
                        height: _radiusAnimation.value,
                      ),
                    ),
                  );
                } /*=> child!,
              child: CustomPaint(
                painter: PolygonPainter(sides: _sidesAnimation.value),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                ),
              ),*/
                ),
            /*const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, ExampleTwoPage.routeName);
                },
                child: const Text('Next'))*/
          ],
        ),
      ),
    );
  }
}

class PolygonPainter extends CustomPainter {
  const PolygonPainter({required this.sides});

  final int sides;

  @override
  void paint(Canvas canvas, Size size) {
    //the pen or the brush to paint with
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (final a in angles) {
      path.lineTo(
        center.dx + radius * cos(a),
        center.dy + radius * sin(a),
      );
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is PolygonPainter && oldDelegate.sides != sides;
}
