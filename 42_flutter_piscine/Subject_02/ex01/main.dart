import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navigator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FirstRoute(),
    );
  }
}

PreferredSize _buildAppBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100.0),
    child: AppBar(
      title: Text(title),
      centerTitle: false,
      backgroundColor: Colors.green,
    ),
  );
}

Widget _buildBody(context, title, Function func) {
  return Center(
    child: TextButton(
      child: Text(title, style: const TextStyle(color: Colors.green)),
      onPressed: () {
        func();
      },
    ),
  );
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('First Page'),
      body: _buildBody(
          context,
          'Go to Second Page',
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Second Page'),
      body:
          _buildBody(context, 'Go to First Page', () => Navigator.pop(context)),
    );
  }
}
