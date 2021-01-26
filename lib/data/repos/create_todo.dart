import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_it/data/models/todo.dart';

class CreateTodoRepo {
  CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  void createTodo({
    final Todo todo,
    final String uid,
  }) {
    _usersCollection.doc(uid).update({
      'todos': FieldValue.arrayUnion([
        {
          "title": todo.title,
          "list": todo.list,
          "priority": todo.priority,
          "startDate": todo.startDate,
          "dueDate": todo.dueDate
        }
      ])
    });
  }
}
