class TodoModel {
  String? title;
  int? id;
  int? userId;
  bool? completed;

  TodoModel(
      {required this.title,
      required this.id,
      required this.userId,
      required this.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'],
        id: json['id'],
        userId: json['userId'],
        completed: json['completed']);
  }
}
