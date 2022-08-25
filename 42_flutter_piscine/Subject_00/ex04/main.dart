import 'package:flutter/material.dart';
import 'custom_widget/poketmon_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Poket'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Poketmon {
  String name = "";
  int level = 1;
  List<String> details = <String>[];

  Poketmon(String name, int level) {
    this.name = name;
    this.level = level;
    details.add('Body Blow');
    details.add('Electric Shocks');
    details.add('Electro Ball');
  }
}

AppBar _buildAppBar(String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.amber[500],
    elevation: 0.0,
    centerTitle: false,
  );
}

Widget _detailList(String discription) {
  return Column(
    children: [
      const SizedBox(
        height: 2.0,
      ),
      Row(children: <Widget>[
        const Icon(Icons.check_circle_outline),
        const SizedBox(
          width: 5.0,
        ),
        Text(discription,
            style: const TextStyle(
                color: Colors.black87, letterSpacing: 1.0, fontSize: 13.0)),
      ]),
      const SizedBox(
        height: 2.0,
      ),
    ],
  );
}

Widget _buildBody() {
  Poketmon pikachu = Poketmon('Pikachu', 4);

  return Padding(
    padding: const EdgeInsets.all(30.0),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      const Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800'),
          radius: 100.0,
        ),
      ),
      const Divider(
        height: 50.0,
        color: Colors.black26,
        thickness: 1.5,
      ),
      const Text('Name',
          style: TextStyle(
              color: Colors.white, letterSpacing: 1.0, fontSize: 25.0)),
      const SizedBox(
        height: 5.0,
      ),
      Text(pikachu.name,
          style: const TextStyle(
              color: Colors.white, letterSpacing: 1.0, fontSize: 50.0)),
      const SizedBox(
        height: 15.0,
      ),
      const Text('Level',
          style: TextStyle(
              color: Colors.white, letterSpacing: 1.0, fontSize: 25.0)),
      const SizedBox(
        height: 5.0,
      ),
      Text('Lv.${pikachu.level}',
          style: const TextStyle(
              color: Colors.white, letterSpacing: 1.0, fontSize: 50.0)),
      const SizedBox(
        height: 40.0,
      ),
      // TODO: how to use forEach
      _detailList(pikachu.details[0]),
      _detailList(pikachu.details[1]),
      _detailList(pikachu.details[2]),
    ]),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.title),
      body: _buildBody(),
      backgroundColor: Colors.amber[200],
    );
  }
}
