import 'dart:math';

import 'package:flutter/material.dart';

class ExampleSixPage extends StatefulWidget {
  const ExampleSixPage({super.key});
  static const String routeName = '/example_six_page';

  @override
  State<ExampleSixPage> createState() => _ExampleSixPageState();
}

class _ExampleSixPageState extends State<ExampleSixPage> {
  Color _color = getRandColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Six'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: const CircleClipper(),
              child: TweenAnimationBuilder(
                tween: ColorTween(
                  begin: getRandColor(),
                  end: _color,
                ),
                onEnd: () => setState(() {
                  _color = getRandColor();
                }),
                duration: const Duration(seconds: 1),
                builder: (context, Color? color, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),
                  child: child!,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, ExampleTwoPage.routeName);
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();
  @override
  Path getClip(Size size) {
    var path = Path();
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

Color getRandColor() {
  return Color(0xff000000 + Random().nextInt(0x00ffffff));
}
