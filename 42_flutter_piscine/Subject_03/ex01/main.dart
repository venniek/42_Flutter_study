class Person {
  String? id;
  int tokenNum = 42;

  Person({this.id});
}

class TokenMachine {
  List<int> tokenList = [10, 22, 31, 42];

  void procData(Person p) {
    accessData(p);
    Future<int> data = fetchData(p);
    
    data.then((val) {
      showData(p, val);
    });
  }

  void accessData(Person p) {
    print('${p.id}님 반갑습니다.');
  }

  Future<int> fetchData(Person p) {
    print('${p.id}님의 토큰 번호를 확인하고 있습니다.');
    return Future.delayed(Duration(seconds: 4)).then((_) {
      return p.tokenNum;
    });
  }

  void showData(Person p, int token) {
    if (tokenList.any((e) => e == token)) {
      print('${p.id}님의 토큰(${token}) 유효합니다.');
    } else {
      print('${p.id}님의 토큰(${token}) 유효하지 않습니다.');
    }
  }
}

void main() {
  Person p1 = Person(id: 'flutter');
  TokenMachine machine = TokenMachine();
  machine.procData(p1);

  return;
}
