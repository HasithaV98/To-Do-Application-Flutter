import 'package:flutter/material.dart';
import 'package:todo_application/todoItem.dart';
import 'package:todo_application/todoModle.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = TodoModel.todoList();
  final _todoController = TextEditingController();
  List<TodoModel> _searchTodo = [];

  @override
  void initState() {
    _searchTodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar_buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                        child: const Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      for (TodoModel todoModel in _searchTodo.reversed)
                        TodoItem(
                          todo: todoModel,
                          onTodoChanged: _handleChange,
                          onDeleteItem: _deleteItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20.0,
                    right: 20.0,
                    left: 20.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 50.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      hintText: 'Add New ToDo Item',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20.0,
                  right: 20.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _addTodoItem(_todoController.text);
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(50.0, 50.0),
                    elevation: 10.0,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  void _handleChange(TodoModel todoModel) {
    setState(() {
      todoModel.done = !todoModel.done;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String toDo) {
    setState(() {
      todoList.add(TodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }

  void _searchTodoItem(String enreredKeyword) {
    List<TodoModel> results = [];
    if (enreredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText
              .toLowerCase()
              .contains(enreredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchTodo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        onChanged: (value) => _searchTodoItem(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              size: 20.0,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20.0,
              maxWidth: 25.0,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            helperStyle: TextStyle(
              color: Colors.grey,
            )),
      ),
    );
  }

  AppBar AppBar_buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.lightGreen,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('name'),
            ),
          )
        ],
      ),
    );
  }
}
