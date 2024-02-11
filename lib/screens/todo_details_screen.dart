import 'package:flutter/material.dart';
import 'package:init/models/todo_model.dart';

class TODODetails extends StatefulWidget {
  final Todo todo;
  const TODODetails({required this.todo, super.key});

  @override
  State<TODODetails> createState() => _TODODetailsState();
}

class _TODODetailsState extends State<TODODetails> {
  final TextEditingController _controlTodoDetail = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controlTodoDetail.text = widget.todo.details.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details todo"),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            Text(
              'Todo: ${widget.todo.todo}',
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 30),
            ),
            TextField(
              controller: _controlTodoDetail,
              minLines: 1,
              maxLines: 40,
              decoration: InputDecoration(
                label: const Text("Detalhes da tarefa."),
                hintText: widget.todo.details,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      widget.todo.details = _controlTodoDetail.text.toString();
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Salvar")),
            )
          ],
        ),
      ),
    );
  }
}
