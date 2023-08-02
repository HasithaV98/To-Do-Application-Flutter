class TodoModel {
  String id;
  String todoText;
  bool done;
  TodoModel({
    this.done = false,
    required this.id,
    required this.todoText,
  });
  static List<TodoModel> todoList() {
    return [
      TodoModel(id: '01', todoText: 'aaa', done: true),
      TodoModel(id: '02', todoText: 'aaa', done: true),
      TodoModel(id: '03', todoText: 'aaa', done: true),
      TodoModel(id: '04', todoText: 'aaa', done: true),
      TodoModel(id: '05', todoText: 'aaa', done: true),
      TodoModel(id: '06', todoText: 'aaa', done: true),
      TodoModel(id: '07', todoText: 'aaa', done: true),
    ];
  }
}
