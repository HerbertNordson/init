class Todo {
  late String todo;
  late String details;
  late bool done;

  Todo({required this.todo, required this.details, required this.done});

  Todo.fromJson(Map<String, dynamic> json) {
    todo = json['todo'];
    details = json['details'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['todo'] = todo;
    data['details'] = details;
    data['done'] = done;
    return data;
  }
  
}
