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
  final _isDone = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _liked = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          _isDone.add(Random().nextInt(2) == 0 ? "done" : "not yet");
          final isLiked = _liked.contains(_suggestions[i]);
          return Dismissible(
            key: Key(_suggestions[i].asPascalCase),
            background: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child:
                  const Text('remove', style: TextStyle(color: Colors.white)),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              alignment: Alignment.centerRight,
              child:
                  const Text('remove', style: TextStyle(color: Colors.white)),
            ),
            child: Card(
              child: ListTile(
                  title: Text(
                    _suggestions[i].asPascalCase,
                    style: _biggerFont,
                  ),
                  subtitle: Text(_isDone[i]),
                  trailing: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null),
                  onTap: () {
                    setState(() {
                      if (isLiked) {
                        _liked.remove(_suggestions[i]);
                      } else {
                        _liked.add(_suggestions[i]);
                      }
                    });
                  }),
            ),
            onDismissed: (direction) {
              setState(() {
                if (direction == DismissDirection.endToStart) {
                  _suggestions.removeAt(i);
                  _isDone.removeAt(i);
                }
                if (direction == DismissDirection.startToEnd) {
                  _suggestions.removeAt(i);
                  _isDone.removeAt(i);
                }
              });
            },
          );
        });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ex02',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ex02'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
