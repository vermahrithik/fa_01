import 'package:a/models/person_model.dart';
import 'package:a/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const People =[
  Person(name: 'John', age: 23, emoji: "🙋‍♂️"),
  Person(name: 'Prakriti', age: 38, emoji: "👸"),
  Person(name: 'Veronica', age: 99, emoji: "👩‍🦳"),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page"),
        backgroundColor: Colors.grey.shade800,
      ),
      body: ListView.builder(
        itemCount: People.length,
        itemBuilder: (context, index) {
          final person = People[index];
          return GestureDetector(
            onTap: () {
              context.goNamed(
                RouteNames.details,
                pathParameters: {
                  'name': person.name,
                  'age': '${person.age}',
                  'emoji': person.emoji,
                },
              );
            },
            child: ListTile(
              leading: Hero(
                tag: person.name,
                  child: Text(
                    person.emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
              ),
              title: Text(person.name),
              subtitle: Text("${person.age} years old"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}