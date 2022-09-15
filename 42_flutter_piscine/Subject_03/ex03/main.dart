import 'package:flutter/material.dart';
import 'model/todo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Json2Dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TodoModel? todo;

  void _fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      setState(() {
        todo = TodoModel.fromJson(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load TodoModel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (todo != null)
                SizedBox(
                  width: double.infinity,
                  child: Card(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('title: ${todo!.title}'),
                      Text('userId: ${todo!.userId}'),
                      Text('id: ${todo!.id}'),
                      Text('completed: ${todo!.completed}'),
                    ],
                  )),
                ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: _fetchData, child: const Text('Fetch Data')),
              ),
            ],
          ),
        ));
  }
}
