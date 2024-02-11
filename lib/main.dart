import 'package:flutter/material.dart';
import 'package:init/screens/todo_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(title: const Text('TODO List')),
        body: const TodoList(),
      ),
    );
  }
}
