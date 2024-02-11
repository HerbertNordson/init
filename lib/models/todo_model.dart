class Todo {
  String? id = "";
  String? todo = "";
  String? details = "";
  bool? done = false;

  Todo({this.id, this.todo, this.details, this.done});

  Map<String, dynamic> toMap() {
    return {'id': id, 'todo': todo, 'details': details, 'done': done};
  }
}
