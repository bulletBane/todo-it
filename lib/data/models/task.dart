import 'list_type.dart';

class Task {
  Task(
      {this.uid,
      this.title,
      this.description,
      this.startDate,
      this.dueDate,
      this.priority,
      this.list})
      // : assert(uid != null, 'Task uid must not be null, but it is null'),
      : assert(title != null, 'Task title must not be null, but it is null');

  factory Task.fromJSON(Map<String, dynamic> json) => Task(
      uid: json['uid'],
      dueDate: json['dueDate'],
      startDate: json['startDate'],
      title: json['title'],
      priority: _getPriority(json['priority']),
      list: ListType.fromJSON(json['list']));

  Map<String, dynamic> toJSON() => {
        'title': title,
        'description': description,
        'startDate': startDate,
        'dueDate': dueDate,
        'priority': _toPriority(priority),
        'list': list.toJSON(),
      };
  set setUid(String newUid) => this.uid = newUid;

  String uid;
  String title;
  String description;
  DateTime startDate;
  DateTime dueDate;
  TaskPriority priority;
  ListType list;
}

const List<Priority> _priorityList = [Low(), Medium(), High(), Extra()];

TaskPriority _getPriority(String priority) {
  _priorityList.forEach((element) {
    TaskPriority taskPriority = element.getPriority(priority);
    if (taskPriority != null) {
      return taskPriority;
    }
  });
  return TaskPriority.NONE;
}

String _toPriority(TaskPriority priority) {
  _priorityList.forEach((element) {
    String taskPriority = element.toPriority(priority);
    if (taskPriority != null) {
      return taskPriority;
    }
  });
  return 'None';
}

enum TaskPriority { LOW, MEDIUM, HIGH, EXTRA, NONE }

abstract class Priority {
  TaskPriority getPriority(String priority);
  String toPriority(TaskPriority priority);
}

class Low implements Priority {
  const Low();
  @override
  TaskPriority getPriority(String priority) =>
      priority == 'low' ? TaskPriority.LOW : null;

  @override
  String toPriority(TaskPriority priority) =>
      priority == TaskPriority.LOW ? 'low' : null;
}

class Medium implements Priority {
  const Medium();
  @override
  TaskPriority getPriority(String priority) =>
      priority == 'medium' ? TaskPriority.MEDIUM : null;

  @override
  String toPriority(TaskPriority priority) =>
      priority == TaskPriority.MEDIUM ? 'medium' : null;
}

class High implements Priority {
  const High();
  @override
  TaskPriority getPriority(String priority) =>
      priority == 'high' ? TaskPriority.HIGH : null;

  @override
  String toPriority(TaskPriority priority) =>
      priority == TaskPriority.HIGH ? 'high' : null;
}

class Extra implements Priority {
  const Extra();
  @override
  TaskPriority getPriority(String priority) =>
      priority == 'extra' ? TaskPriority.EXTRA : null;

  @override
  String toPriority(TaskPriority priority) =>
      priority == TaskPriority.EXTRA ? 'extra' : null;
}
