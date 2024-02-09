import 'package:flutter/material.dart';

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

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _controlNewTodo = TextEditingController();

  final List<String> _itemsList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextField(
              controller: _controlNewTodo,
              decoration:
                  const InputDecoration(label: Text("Insira uma nova tarefa.")),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(8),
              child: ElevatedButton(
                child: const Text("Adicionar"),
                onPressed: () {
                  setState(() {
                    _itemsList.add(_controlNewTodo.text.toString());
                    _controlNewTodo.text = "";
                  });
                },
              ),
            ),
          ]),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: _itemsList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _itemsList[index].toString(),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _itemsList.remove(_itemsList[index]);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  label: const Text(""),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(style: BorderStyle.none),
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
