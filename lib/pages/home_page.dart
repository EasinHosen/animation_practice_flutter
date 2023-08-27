import 'package:animation_practice/pages/example_eight_page.dart';
import 'package:animation_practice/pages/example_five_page.dart';
import 'package:animation_practice/pages/example_four_page.dart';
import 'package:animation_practice/pages/example_seven_page.dart';
import 'package:animation_practice/pages/example_six_page.dart';
import 'package:flutter/material.dart';

import 'example_one_page.dart';
import 'example_three_page.dart';
import 'example_two_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Animations',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTitledButton(
                    title: 'Simple Animation',
                    buttonText: 'Example 1',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleOnePage.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTitledButton(
                    title: 'Complex Animation',
                    buttonText: 'Example 2',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleTwoPage.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTitledButton(
                    title: '3d Animation',
                    buttonText: 'Example 3',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleThreePage.routeName);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTitledButton(
                    title: 'Hero Animation',
                    buttonText: 'Example 4',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleFourPage.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTitledButton(
                    title: 'Implicit Animation',
                    buttonText: 'Example 5',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleFivePage.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTitledButton(
                    title: 'Implicit Animation',
                    buttonText: 'Example 6',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleSixPage.routeName);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTitledButton(
                    title: 'Custom Painter',
                    buttonText: 'Example 7',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleSevenPage.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTitledButton(
                    title: 'Animated drawer',
                    buttonText: 'Example 8',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleEightPage.routeName);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTitledButton(
                    title: 'Explicit Animation',
                    buttonText: 'Example 9',
                    onPressed: () {
                      Navigator.pushNamed(context, ExampleSixPage.routeName);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTitledButton extends StatelessWidget {
  const CustomTitledButton(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.onPressed});
  final String title, buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(onPressed: onPressed, child: Text(buttonText))
      ],
    );
  }
}
