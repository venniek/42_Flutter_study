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
