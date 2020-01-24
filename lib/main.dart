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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  TodoOverviewPageState createState() => TodoOverviewPageState();
}

class TodoOverviewPageState extends State<TodoOverviewPage> {
  int _counter = 0;
  final List<String> todos = <String>["1. Todo", "2. Todo", "3. Todo"];

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
        return new Text(todos[index]);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
