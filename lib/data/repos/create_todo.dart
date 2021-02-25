import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_it/data/models/task.dart';

class CreateTodoRepo {
  CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');
  String uid = FirebaseAuth.instance.currentUser.uid;

  void createTodo({
    Task task,
  }) async {
    String taskUID =
        await _taskCollection.add(task.toJSON()).then((value) => value.id);
    print('TASK UID == $taskUID');
    _usersCollection.doc(uid).update({
      'tasks': FieldValue.arrayUnion([taskUID])
    });
  }
}
