import 'package:flutter/material.dart';
import 'package:todo_application/todoModle.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key, required this.todo, this.onTodoChanged, this.onDeleteItem});
  final TodoModel todo;
  final onTodoChanged;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        onTap: () {
          onTodoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.done ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            decoration: todo.done ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 20.0,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
