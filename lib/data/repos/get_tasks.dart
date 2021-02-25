import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_it/data/models/task.dart';

abstract class GetTasksRepo {
  Future<List<Task>> getTasks();
}

class GetActiveTasks implements GetTasksRepo {
  @override
  Future<List<Task>> getTasks() async {
    /// this function is implementation of [GetTaskRepos] function and return the active user's [Task]
    CollectionReference _usersCollection =
        FirebaseFirestore.instance.collection('users');

    String uid = FirebaseAuth.instance.currentUser.uid;

    List<String> taskUids =
        await _usersCollection.doc(uid).get().then((val) => val['activeTodos']);

    bool taskUidsIsNotEmpty = taskUids.isNotEmpty;

    if (taskUidsIsNotEmpty) {
      //
      CollectionReference tasksCollection =
          FirebaseFirestore.instance.collection('tasks');

      List<Task> tasks = [];

      taskUids.forEach((_uid) {
        tasksCollection
            .doc(_uid)
            .get()
            .then((json) => tasks.add(Task.fromJSON(json['task'])));
      });
      return tasks;
      //
    } else {
      return null;
    }
  }
}

class GetFinishedTasks implements GetTasksRepo {
  @override
  Future<List<Task>> getTasks() async {
    /// this function is implementation of [GetTaskRepos] function and return the active user's [Task]
    CollectionReference _usersCollection =
        FirebaseFirestore.instance.collection('users');

    String uid = FirebaseAuth.instance.currentUser.uid;

    List<String> taskUids = await _usersCollection
        .doc(uid)
        .get()
        .then((val) => val['finishedTodos']);

    bool taskUidsIsNotEmpty = taskUids.isNotEmpty;

    if (taskUidsIsNotEmpty) {
      //
      CollectionReference tasksCollection =
          FirebaseFirestore.instance.collection('tasks');

      List<Task> tasks = [];

      taskUids.forEach((_uid) {
        tasksCollection
            .doc(_uid)
            .get()
            .then((json) => tasks.add(Task.fromJSON(json['task'])));
      });
      return tasks;
      //
    } else {
      return null;
    }
  }
}
