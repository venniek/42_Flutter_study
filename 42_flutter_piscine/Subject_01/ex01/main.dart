import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EX01',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'ex01'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppBar _buildAppBar(String title) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Table(
          border: const TableBorder(
              horizontalInside: BorderSide(
                width: 5,
                color: Colors.black,
              ),
              verticalInside: BorderSide(
                width: 5,
                color: Colors.black,
              )),
          children: [
            TableRow(
              children: [
                // table 1
                Container(
                    height: 200,
                    color: Colors.white,
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, size: 50),
                        Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          direction: Axis.horizontal,
                          children: const [
                            Icon(Icons.star, size: 30),
                            Icon(Icons.star, size: 100),
                            Icon(Icons.star, size: 30),
                          ],
                        ),
                        const Icon(Icons.star, size: 50),
                      ],
                    )),
                // table 2
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ],
            ),
            TableRow(
              children: [
                // table 3
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.bottom,
                  child: Container(
                    height: 120,
                    color: Colors.purple,
                  ),
                ),
                // table 4
                TableCell(
                  // table 4
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 50,
                          color: Colors.amber,
                        ),
                        Container(
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
            )),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.title),
      body: _buildBody(),
    );
  }
}
