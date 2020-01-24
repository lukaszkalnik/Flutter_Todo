import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoOverviewPage(title: 'Todo Overview'),
    );
  }
}

class TodoOverviewPage extends StatefulWidget {
  TodoOverviewPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  TodoOverviewPageState createState() => TodoOverviewPageState();
}

class TodoOverviewPageState extends State<TodoOverviewPage> {

  final List<String> todos = <String>["1. Todo", "2. Todo", "3. Todo", "4. Todo", "5. Todo", "6. Todo", "7. Todo"];

  final TextStyle _biggerFont = const TextStyle(fontSize: 40, color: Colors.pink);

  void _swap(List<String> newTodos) {
    setState(() {
      todos.clear();
      todos.addAll(newTodos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return _buldRow(todos[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.add("new Item!!!");
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buldRow(String todo) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      title: Text(todo, style: _biggerFont),
    onTap: () {print("edit $todo");}
  );

}
