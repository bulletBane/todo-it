import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_it/data/models/todo.dart';

abstract class GetTodoRepo {
  Future<List<Todo>> getTodo(String uid);
}

class GetActieTodosRepo implements GetTodoRepo {
  @override
  Future<List<Todo>> getTodo(String uid) async {
    CollectionReference _usersCollection =
        FirebaseFirestore.instance.collection('users');
    List json =
        await _usersCollection.doc(uid).get().then((val) => val['todos']);
    List<Todo> todos = [];
    json.forEach((val) => todos.add(Todo.fromJSON(val)));
    return todos;
  }
}

class GetDoneTodosRepo implements GetTodoRepo {
  @override
  Future<List<Todo>> getTodo(String uid) async {
    CollectionReference taskCollection =
        FirebaseFirestore.instance.collection('tasks');
    List json = await taskCollection.doc(uid).get().then((val) => val['todos']);
    bool jsonIsEmpty = json.isEmpty;

    if (jsonIsEmpty) {
      return null;
    } else {
      List<Todo> todos = [];
      json.forEach((val) => todos.add(Todo.fromJSON(val)));
      return todos;
    }
  }
}
