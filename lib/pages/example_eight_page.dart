import 'dart:math';

import 'package:flutter/material.dart';

class ExampleEightPage extends StatefulWidget {
  const ExampleEightPage({super.key});
  static const String routeName = '/example_eight_page';

  @override
  State<ExampleEightPage> createState() => _ExampleEightPageState();
}

class _ExampleEightPageState extends State<ExampleEightPage> {
  @override
  Widget build(BuildContext context) {
    return MyDrawer(
      drawer: Material(
        child: Container(
          color: const Color(0xff24283b),
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 80, top: 100),
            itemCount: 5,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'Item $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          color: const Color(0xff414868),
        ),
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.child, required this.drawer});
  final Widget child, drawer;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  late AnimationController _xControllerForChild;
  late Animation<double> _yRotationAnimationForChild;

  late AnimationController _xControllerForDrawer;
  late Animation<double> _yRotationAnimationForDrawer;

  @override
  void initState() {
    _xControllerForChild = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _yRotationAnimationForChild = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(_xControllerForChild);

    _xControllerForDrawer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _yRotationAnimationForDrawer = Tween<double>(
      begin: -pi / 2.7,
      end: 0,
    ).animate(_xControllerForChild);

    super.initState();
  }

  @override
  void dispose() {
    _xControllerForChild.dispose();
    _xControllerForDrawer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final maxDrag = width * 0.8;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final delta = details.delta.dx / maxDrag;
        _xControllerForChild.value += delta;
        _xControllerForDrawer.value += delta;
      },
      onHorizontalDragEnd: (details) {
        if (_xControllerForChild.value < 0.5) {
          _xControllerForChild.reverse();
          _xControllerForDrawer.reverse();
        } else {
          _xControllerForChild.forward();
          _xControllerForDrawer.forward();
        }
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _xControllerForDrawer,
          _xControllerForChild,
        ]),
        builder: (context, child) => Stack(
          children: [
            Container(
              color: const Color(0xff1a1b26),
            ),
            Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(_xControllerForChild.value * maxDrag)
                ..rotateY(_yRotationAnimationForChild.value),
              child: widget.child,
            ),
            Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(_xControllerForDrawer.value * maxDrag - width)
                ..rotateY(_yRotationAnimationForDrawer.value),
              child: widget.drawer,
            ),
          ],
        ),
      ),
    );
  }
}
