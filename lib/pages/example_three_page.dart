import 'package:flutter/material.dart';

class ExampleThreePage extends StatefulWidget {
  const ExampleThreePage({super.key});
  static const String routeName = '/example_three_page';

  @override
  State<ExampleThreePage> createState() => _ExampleThreePageState();
}

class _ExampleThreePageState extends State<ExampleThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation three'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
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
