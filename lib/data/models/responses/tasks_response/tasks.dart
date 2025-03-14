class Todos {
  Todos({
    this.id,
    this.todo,
    this.completed,
    this.userId,});

  Todos.fromJson(dynamic json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }
  int? id;
  String? todo;
  bool? completed;
  int? userId;
  Todos copyWith({  int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) => Todos(  id: id ?? this.id,
    todo: todo ?? this.todo,
    completed: completed ?? this.completed,
    userId: userId ?? this.userId,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['todo'] = todo;
    map['completed'] = completed;
    map['userId'] = userId;
    return map;
  }

}