class Todo {
  final String dueDate;
  final String startDate;
  final String priority;
  final String title;
  final String list;

  Todo({this.dueDate, this.startDate, this.priority, this.title, this.list});
  factory Todo.fromJSON(Map<String, dynamic> json) => Todo(
      dueDate: json['dueDate'],
      startDate: json['startDate'],
      title: json['title'],
      priority: json['priority'],
      list: json['list']);
}
