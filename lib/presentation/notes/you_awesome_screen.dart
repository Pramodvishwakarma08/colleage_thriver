import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController _controller = TextEditingController();
  List<TodoItem> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _todos = TodoItem.decode(prefs.getStringList('todos') ?? []);
    });
  }

  Future<void> _saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', TodoItem.encode(_todos));
  }

  void _addTodo() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _todos.add(TodoItem(title: _controller.text, done: false));
        _controller.clear();
        _saveTodos();
      }
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
      _saveTodos();
    });
  }

  void _updateTodo(int index, String newTitle) {
    setState(() {
      _todos[index].title = newTitle;
      _saveTodos();
    });
  }

  void _toggleDone(int index) {
    setState(() {
      _todos[index].done = !_todos[index].done;
      _saveTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO List'),
        centerTitle: true,
        elevation: 0,
      ),
      body:_todos.length==0 ? Center(child: Text("No TO DO found"),) : Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return TodoItemWidget(
                  todo: _todos[index],
                  onRemove: () => _removeTodo(index),
                  onUpdate: (newTitle) => _updateTodo(index, newTitle),
                  onToggle: () => _toggleDone(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add TO DO',style: TextStyle(fontSize: 16),),
                content: CustomTextFormField(
                  controller: _controller,
                  maxLines: 4,
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      _addTodo();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}

class TodoItem {
  String title;
  bool done;

  TodoItem({required this.title, required this.done});

  static List<String> encode(List<TodoItem> items) {
    return items.map((item) => '${item.title}:${item.done ? 1 : 0}').toList();
  }

  static List<TodoItem> decode(List<String> encoded) {
    return encoded.map((item) {
      List<String> parts = item.split(':');
      return TodoItem(title: parts[0], done: parts[1] == '1');
    }).toList();
  }
}

typedef void OnRemove();
typedef void OnUpdate(String newTitle);
typedef void OnToggle();

class TodoItemWidget extends StatelessWidget {
  final TodoItem todo;
  final OnRemove onRemove;
  final OnUpdate onUpdate;
  final OnToggle onToggle;

  TodoItemWidget({
    required this.todo,
    required this.onRemove,
    required this.onUpdate,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.v,),
        Card(
          elevation: 1.0,
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            leading: Checkbox(
              value: todo.done,
              onChanged: (bool? value) {
                onToggle();
              },
            ),
            title: todo.done
                ? Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  )
                : Text(
                    todo.title,
                    style: TextStyle(fontSize: 14),
                  ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit,color: theme.primaryColor,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController controller = TextEditingController(text: todo.title);
                        return AlertDialog(
                          title: Text('Edit TO DO',style: TextStyle(fontSize: 16),),
                          content: CustomTextFormField(
                            controller: controller,
                            maxLines: 4,
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Update'),
                              onPressed: () {
                                onUpdate(controller.text);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete,color: Colors.red,),
                  onPressed: () {
                    onRemove();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
