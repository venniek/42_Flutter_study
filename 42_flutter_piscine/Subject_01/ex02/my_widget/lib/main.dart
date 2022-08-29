import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return Card(
            child: ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
              subtitle: Text(Random().nextInt(2) == 0 ? "done" : "not yet"),
              trailing: const Icon(Icons.favorite_border),
            ),
          );
        });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
