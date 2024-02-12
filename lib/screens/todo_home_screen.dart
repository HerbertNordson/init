import 'package:flutter/material.dart';
import 'package:init/models/todo_model.dart';

import 'todo_details_screen.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _controlNewTodo = TextEditingController();

  final List<Todo> _itemsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextField(
              controller: _controlNewTodo,
              decoration: const InputDecoration(
                label: Text("Insira uma nova tarefa."),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(8),
              child: ElevatedButton(
                child: const Text("Adicionar"),
                onPressed: () {
                  final Todo todo = Todo();
                  todo.todo = _controlNewTodo.text.toString();
                  todo.details = "";
                  setState(() {
                    _itemsList.add(todo);
                    _controlNewTodo.clear();
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
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Row(
                children: [
                  SizedBox(
                    width: 230,
                    child: ListTile(
                      title: Text(
                        _itemsList[index].todo.toString(),
                        style: TextStyle(
                          decoration: _itemsList[index].done != null
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      leading: Radio(
                        value: true,
                        groupValue: _itemsList[index].done,
                        onChanged: (value) {
                          setState(() {
                            _itemsList[index].done = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TODODetails(todo: _itemsList[index]),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(style: BorderStyle.none),
                    ),
                    child: const Text("detalhes"),
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
          ),
        ),
      ],
    );
  }
}
