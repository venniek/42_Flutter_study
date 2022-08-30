import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage(title: "ex03")));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, @required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Order',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: PizzaBody(),
      ),
    );
  }
}

class PizzaBody extends StatefulWidget {
  const PizzaBody({Key key}) : super(key: key);

  @override
  State<PizzaBody> createState() => _PizzaBodyState();
}

class _PizzaBodyState extends State<PizzaBody> {
  final List<String> _dough = <String>["오리지널 도우", "씬 도우"];
  final List<Widget> _doughImage = <Widget>[
    const Image(image: AssetImage('asset/오리지널도우.jpeg')),
    const Image(image: AssetImage('asset/씬도우.jpeg')),
  ];

  final List<String> _sauce = <String>["토마토 소스", "특제 소스"];
  final List<Widget> _sauceImage = <Widget>[
    const Image(image: AssetImage('asset/토마토소스.jpeg')),
    const Image(image: AssetImage('asset/특제소스.jpg')),
  ];

  final List<String> _cheese = <String>["모짜렐라 치즈", "고르곤졸라 치즈"];
  final List<Widget> _cheeseImage = <Widget>[
    const Image(image: AssetImage('asset/모짜렐라치즈.jpeg')),
    const Image(image: AssetImage('asset/고르곤졸라치즈.jpeg')),
  ];

  final List<String> _mainItem = <String>["페퍼로니", "null", "감자", "베이컨"];
  final List<Widget> _mainImage = <Widget>[
    const Image(image: AssetImage('asset/페퍼로니.jpg')),
    const Image(image: AssetImage('asset/null.png')),
    const Image(image: AssetImage('asset/감자.jpeg')),
    const Image(image: AssetImage('asset/베이컨.jpeg')),
  ];

  final List<String> _pizzaStack = <String>[];
  List<List> _menuItems;
  List<String> _orderMenu;
  String _orderedPizza = " ";
  int _orderedPizzaIndex;

  @override
  void initState() {
    super.initState();
    _menuItems = <List>[
      [_dough[0], _sauce[0], _cheese[0], _mainItem[0]],
      [_dough[1], _sauce[0], _cheese[0], _mainItem[1]],
      [_dough[0], _sauce[1], _cheese[1], _mainItem[2]],
      [_dough[1], _sauce[1], _cheese[0], _mainItem[3]],
    ];
    _orderMenu = <String>[
      "페퍼로니 피자",
      "치즈 피자",
      "포테이토 피자",
      "베이컨 피자",
    ];
    _getNewPizzaOrder();
  }

  void _getNewPizzaOrder() {
    _orderedPizzaIndex = Random().nextInt(4);
    _orderedPizza = _orderMenu[_orderedPizzaIndex];
  }

  Widget _getFrame() {
    return Stack(
      alignment: Alignment.center,
      children: const <Widget>[
        Image(image: AssetImage('asset/frame.png')),
        Text(
          "Drop Here",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _callSnackbar(String item) {
    return SnackBar(
      content: Text(item),
    );
  }

  Widget _itemImages(context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Builder(
          builder: (BuildContext context) {
            int size = _pizzaStack.length;

            if (size == 0) {
              return _pizzaItemWidget(
                  _dough[0], _dough[1], _doughImage[0], _doughImage[1]);
            } else if (size == 1) {
              return _pizzaItemWidget(
                  _sauce[0], _sauce[1], _sauceImage[0], _sauceImage[1]);
            } else if (size == 2) {
              return _pizzaItemWidget(
                  _cheese[0], _cheese[1], _cheeseImage[0], _cheeseImage[1]);
            } else {
              return _pizzaMainItemWidget();
            }
          },
        ),
      ],
    );
  }

  void _getDialog(flag) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              children: <Widget>[
                new Text("result"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  flag == true ? "맛있는 피자 완성!" : "피자 만들기 실패ㅠㅠ",
                ),
              ],
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("확인", style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "주문 피자 : $_orderedPizza",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: DragTarget(
                        builder: (BuildContext context, List<Object> test1,
                            List<dynamic> test2) {
                          return _getFrame();
                        },
                        onWillAccept: (data) {
                          return true;
                        },
                        onAccept: (data) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (_pizzaStack.length < 3) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_callSnackbar(data));
                          }
                          if (_pizzaStack.length < 4) _pizzaStack.add(data);
                          setState(() {
                            if (_pizzaStack.length >= 4) {
                              var flag = true;
                              for (var i = 0; i < _pizzaStack.length; i++) {
                                if (_menuItems[_orderedPizzaIndex][i] !=
                                    _pizzaStack[i]) {
                                  flag = false;
                                  break;
                                }
                              }
                              _getDialog(flag);
                              _pizzaStack.clear();
                              _getNewPizzaOrder();
                            }
                          });
                        },
                      ),
                    )),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
          const Divider(
            thickness: 4,
            color: Colors.black54,
          ),
          _itemImages(context),
        ],
      ),
    );
  }

  Widget _pizzaItemWidget(String left, String right, src1, src2) {
    Widget menu1 = getImgWidget(src1);
    Widget menu2 = getImgWidget(src2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Draggable(
          childWhenDragging: Container(),
          feedback: menu1,
          data: left,
          child: menu1,
        ),
        const SizedBox(
          width: 20,
        ),
        Draggable(
          childWhenDragging: Container(),
          feedback: menu2,
          data: right,
          child: menu2,
        ),
      ],
    );
  }

  Widget _pizzaMainItemWidget() {
    // 한번만 쓰는거 같아서, 인자 안 받고 그냥 쓰도록
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _pizzaItemWidget(
            _mainItem[0], _mainItem[1], _mainImage[0], _mainImage[1]),
        const SizedBox(
          height: 15,
        ),
        _pizzaItemWidget(
            _mainItem[2], _mainItem[3], _mainImage[2], _mainImage[3]),
      ],
    );
  }

  Container getImgWidget(Widget image) {
    return Container(
      width: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(
            5,
            5,
          ),
        )
      ]),
      alignment: Alignment.center,
      child: image,
    );
  }
}
