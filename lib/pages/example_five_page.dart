import 'package:animation_practice/pages/example_six_page.dart';
import 'package:flutter/material.dart';

class ExampleFivePage extends StatefulWidget {
  const ExampleFivePage({super.key});
  static const String routeName = '/example_five_page';

  @override
  State<ExampleFivePage> createState() => _ExampleFivePageState();
}

class _ExampleFivePageState extends State<ExampleFivePage> {
  String _btnTitle = 'Zoom In';
  bool _isZoomedIn = false;
  double _width = 200;
  Curve _curve = Curves.linear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Five'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 370),
              curve: _curve,
              width: _width,
              child: Image.asset('assets/images/img.jpg'),
            ),
            TextButton(
              onPressed: () {
                _isZoomedIn = !_isZoomedIn;
                _btnTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                _width = _isZoomedIn ? MediaQuery.of(context).size.width : 200;
                _curve = _isZoomedIn ? Curves.bounceOut : Curves.easeInCubic;
                setState(() {});
              },
              child: Text(_btnTitle),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ExampleSixPage.routeName);
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
