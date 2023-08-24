import 'package:animation_practice/pages/example_four_page2.dart';
import 'package:flutter/material.dart';

class ExampleFourPage extends StatefulWidget {
  const ExampleFourPage({super.key});
  static const String routeName = '/example_four_page';

  @override
  State<ExampleFourPage> createState() => _ExampleFourPageState();
}

class _ExampleFourPageState extends State<ExampleFourPage> {
  @override
  Widget build(BuildContext context) {
    final List<Person> people = [
      Person(name: 'Sam', emoji: '👱‍♂️', age: 28),
      Person(name: 'Wanda', emoji: '👩‍🦰', age: 22),
      Person(name: 'Peter', emoji: '👨‍🦰', age: 17),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Four'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  final person = people[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ExampleFourPage2.routeName,
                        arguments: {'argument': person},
                      );
                    },
                    title: Text(person.name),
                    subtitle: Text('${person.age} years old'),
                    leading: Hero(
                      tag: person.emoji,
                      child: Text(
                        person.emoji,
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, ExampleFourPage.routeName);
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}

class Person {
  String name, emoji;
  int age;

  Person({
    required this.name,
    required this.emoji,
    required this.age,
  });
}
